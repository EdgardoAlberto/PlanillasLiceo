<?php
namespace App\Http\Controllers;

use App\Models\Employee;
use App\Models\Payroll;
use App\Models\PayrollDetail;
use Illuminate\Http\Request;

class ReportController extends Controller
{
    public function index()
    {
        $empleados = Employee::orderBy('first_name')->orderBy('last_name')->get();
        return view('reportes.index', compact('empleados'));
    }

    public function bancario(Request $request)
    {
        $request->validate([
            'month' => 'required|integer',
            'year' => 'required|integer'
        ]);

        $month = $request->month;
        $year = $request->year;

        $payrolls = Payroll::where('month', $month)
            ->where('year', $year)
            ->where('status', 'Aprobada')
            ->pluck('id');

        if ($payrolls->isEmpty()) {
            return back()->with('error', 'No hay planillas aprobadas para ese mes y año.');
        }

        $details = PayrollDetail::whereIn('payroll_id', $payrolls)
            ->with(['employee.level'])
            ->get()
            ->sortBy(function($detail) {
                return $detail->employee->first_name . ' ' . $detail->employee->last_name;
            })->values();

        return view('reportes.bancario', compact('details', 'month', 'year'));
    }

    public function historico(Request $request)
    {
        $request->validate(['employee_id' => 'required|exists:employees,id']);
        
        $empleado = Employee::with('level')->findOrFail($request->employee_id);
        
        $historicoQuery = PayrollDetail::where('employee_id', $empleado->id)
            ->with(['payroll', 'deductions.deductionType']);

        if ($request->filled('month')) {
            $historicoQuery->whereHas('payroll', function($q) use ($request) {
                $q->where('month', $request->month);
            });
        }
        
        if ($request->filled('year')) {
            $historicoQuery->whereHas('payroll', function($q) use ($request) {
                $q->where('year', $request->year);
            });
        }

        $historico = $historicoQuery->get()
            ->sortByDesc(function($detail) {
                return sprintf('%04d%02d', $detail->payroll->year, $detail->payroll->month);
            });

        return view('reportes.historico', compact('empleado', 'historico'));
    }
}
