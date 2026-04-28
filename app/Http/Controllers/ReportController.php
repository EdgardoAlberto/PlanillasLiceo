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
                $rawLevelName = $detail->employee->level->name ?? '';
                $levelName = mb_strtolower($rawLevelName, 'UTF-8');
                $levelName = str_replace(
                    ['á', 'é', 'í', 'ó', 'ú', 'ñ'],
                    ['a', 'e', 'i', 'o', 'u', 'n'],
                    $levelName
                );
                
                $order = 6; // Por defecto al final si no coincide

                if (str_contains($levelName, 'administracion') || str_contains($levelName, 'apoyo')) {
                    $cat = mb_strtolower($detail->employee->support_category ?? '', 'UTF-8');
                    $cat = str_replace(['á', 'é', 'í', 'ó', 'ú', 'ñ'], ['a', 'e', 'i', 'o', 'u', 'n'], $cat);
                    
                    if (str_contains($cat, 'apoyo')) {
                        $order = 2;
                    } elseif (str_contains($cat, 'admin')) {
                        $order = 1;
                    } else {
                        // Si no hay categoría, o no coincide, usamos el nombre del nivel
                        if (str_contains($levelName, 'administracion') && !str_contains($levelName, 'apoyo')) {
                            $order = 1;
                        } elseif (str_contains($levelName, 'apoyo') && !str_contains($levelName, 'administracion')) {
                            $order = 2;
                        } else {
                            $order = 1; // Por defecto a 1 si es un nivel combinado pero no tiene categoría
                        }
                    }
                } elseif (str_contains($levelName, 'prebasica') || str_contains($levelName, 'pre-basica')) {
                    $order = 3;
                } elseif (str_contains($levelName, 'basica') || str_contains($levelName, 'primaria')) {
                    $order = 4;
                } elseif (str_contains($levelName, 'secundaria') || str_contains($levelName, 'media')) {
                    $order = 5;
                }

                return sprintf('%d-%s %s', $order, $detail->employee->first_name, $detail->employee->last_name);
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
