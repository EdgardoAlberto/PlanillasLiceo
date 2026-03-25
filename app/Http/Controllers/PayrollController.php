<?php
namespace App\Http\Controllers;

use App\Models\Employee;
use App\Models\Payroll;
use App\Models\PayrollDetail;
use App\Models\PayrollDetailDeduction;
use App\Models\PayrollLevel;
use App\Models\User;
use App\Mail\PayrollApprovedMail;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class PayrollController extends Controller
{
    public function index()
    {
        $planillas = Payroll::with(['level', 'creator'])
            ->orderBy('year', 'desc')
            ->orderBy('month', 'desc')
            ->get();
        return view('planillas.index', compact('planillas'));
    }

    public function historial()
    {
        $planillas = Payroll::with(['level', 'creator'])
            ->whereIn('status', ['Aprobada', 'Enviada', 'Pagada'])
            ->orderBy('year', 'desc')
            ->orderBy('month', 'desc')
            ->get();
        return view('planillas.index', compact('planillas'));
    }

    public function create()
    {
        $niveles = PayrollLevel::all();
        return view('planillas.create', compact('niveles'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'month' => 'required|integer|min:1|max:12',
            'year' => 'required|integer|min:2020|max:2050',
            'level_id' => 'required|exists:payroll_levels,id'
        ]);

        if (Payroll::where('month', $request->month)->where('year', $request->year)->where('level_id', $request->level_id)->exists()) {
            return back()->with('error', 'Ya existe una planilla para ese nivel en ese mes y año.');
        }

        $empleados = Employee::where('level_id', $request->level_id)->where('status', 'Activo')->get();
        if ($empleados->isEmpty()) {
            return back()->with('error', 'No hay empleados activos en ese nivel.');
        }

        DB::beginTransaction();
        try {
            $planilla = Payroll::create([
                'month' => $request->month,
                'year' => $request->year,
                'level_id' => $request->level_id,
                'status' => 'Borrador',
                'created_by' => auth()->id()
            ]);

            $currentDate = Carbon::createFromDate($request->year, $request->month, 1);
            $prevDate = $currentDate->copy()->subMonth();
            $prevPayroll = Payroll::where('month', $prevDate->month)
                ->where('year', $prevDate->year)
                ->where('level_id', $request->level_id)
                ->first();

            foreach ($empleados as $emp) {
                $detail = PayrollDetail::create([
                    'payroll_id' => $planilla->id,
                    'employee_id' => $emp->id,
                    'base_salary' => $emp->base_salary,
                    'total_deductions' => 0,
                    'net_salary' => $emp->base_salary
                ]);

                $totalDeductions = 0;

                if ($prevPayroll) {
                    $prevDetail = PayrollDetail::where('payroll_id', $prevPayroll->id)->where('employee_id', $emp->id)->first();
                    if ($prevDetail) {
                        foreach ($prevDetail->deductions as $prevDed) {
                            PayrollDetailDeduction::create([
                                'payroll_detail_id' => $detail->id,
                                'deduction_type_id' => $prevDed->deduction_type_id,
                                'amount' => $prevDed->amount
                            ]);
                            $totalDeductions += $prevDed->amount;
                        }
                    }
                } else {
                    $deductionsTypeIds = DB::table('deduction_type_payroll_level')
                        ->where('payroll_level_id', $request->level_id)->pluck('deduction_type_id');
                    foreach ($deductionsTypeIds as $dtype) {
                        PayrollDetailDeduction::create([
                            'payroll_detail_id' => $detail->id,
                            'deduction_type_id' => $dtype,
                            'amount' => 0
                        ]);
                    }
                }

                $detail->update([
                    'total_deductions' => $totalDeductions,
                    'net_salary' => $detail->base_salary - $totalDeductions
                ]);
            }
            DB::commit();
            return redirect('/planillas/'.$planilla->id)->with('success', 'Planilla generada en Borrador. Revise las deducciones.');
        } catch (\Exception $e) {
            DB::rollback();
            return back()->with('error', 'Error al generar planilla: ' . $e->getMessage());
        }
    }

    public function show(Payroll $planilla)
    {
        $planilla->load('details.employee', 'details.deductions.deductionType', 'level');
        $deductionsList = $planilla->level->deductionTypes()->orderBy('sort_order')->get();
        return view('planillas.show', compact('planilla', 'deductionsList'));
    }

    public function updateDeductions(Request $request, Payroll $planilla)
    {
        if ($planilla->status !== 'Borrador') {
            return back()->with('error', 'Solo se pueden editar planillas en estado Borrador.');
        }

        DB::beginTransaction();
        try {
            if($request->has('deductions')) {
                foreach ($request->deductions as $detailId => $deductionTypes) {
                    $detail = PayrollDetail::findOrFail($detailId);
                    $total = 0;
                    foreach ($deductionTypes as $typeId => $amount) {
                        $amt = floatval(str_replace(',', '', $amount ?? 0));
                        PayrollDetailDeduction::updateOrCreate(
                            ['payroll_detail_id' => $detailId, 'deduction_type_id' => $typeId],
                            ['amount' => $amt]
                        );
                        $total += $amt;
                    }
                    $detail->update([
                        'total_deductions' => $total,
                        'net_salary' => $detail->base_salary - $total
                    ]);
                }
            }
            DB::commit();
            return back()->with('success', 'Deducciones guardadas y cálculos actualizados.');
        } catch (\Exception $e) {
            DB::rollback();
            return back()->with('error', 'Error: ' . $e->getMessage());
        }
    }

    public function cambiarEstado(Request $request, Payroll $planilla)
    {
        $status = $request->status;
        $role = auth()->user()->role->name;

        if ($status == 'Revisada') {
            $planilla->update(['status' => 'Revisada', 'reviewed_by' => auth()->id()]);
        } elseif ($status == 'Aprobada' && ($role === 'Religiosa' || $role === 'Administrador')) {
            $planilla->update(['status' => 'Aprobada', 'approved_by' => auth()->id()]);
            
            // Envío de correo a administradores
            $admins = User::whereHas('role', function($q) {
                $q->whereIn('name', ['Administrador', 'Contadora']);
            })->pluck('email');
            
            if($admins->count() > 0) {
                try {
                    Mail::to($admins)->send(new PayrollApprovedMail($planilla));
                } catch (\Exception $e) {
                    \Illuminate\Support\Facades\Log::error('Error correo planilla: ' . $e->getMessage());
                }
            }
        } elseif ($status == 'Borrador' && $role === 'Administrador') {
            // Revertir a borrador
            $planilla->update(['status' => 'Borrador', 'approved_by' => null, 'reviewed_by' => null]);
        } else {
            return back()->with('error', 'No tienes permiso o acción inválida.');
        }
        return back()->with('success', 'Estado cambiado a ' . $status);
    }

    public function vouchers(Payroll $planilla)
    {
        $planilla->load('details.employee', 'details.deductions.deductionType', 'level');
        $deductionsList = $planilla->level->deductionTypes()->orderBy('sort_order')->get();
        return view('planillas.vouchers', compact('planilla', 'deductionsList'));
    }
}
