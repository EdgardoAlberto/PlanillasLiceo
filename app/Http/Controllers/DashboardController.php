<?php
namespace App\Http\Controllers;

use App\Models\Employee;
use App\Models\Payroll;
use App\Models\PayrollDetail;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        $mesesEspanol = ['', 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];

        $filtroMes = $request->get('month');
        $filtroAnio = $request->get('year');

        // Obtener períodos únicos disponibles
        $periodosDisponibles = Payroll::select('month', 'year')
            ->distinct()
            ->orderBy('year', 'desc')
            ->orderBy('month', 'desc')
            ->get();

        $totalEmpleados = Employee::where('status', 'Activo')->count();

        $queryPlanillasActivas = Payroll::whereIn('status', ['Borrador', 'Revisada']);
        $queryPlanillasAprobadas = Payroll::where('status', 'Aprobada');
        $queryDeducciones = PayrollDetail::query();
        $queryNeto = PayrollDetail::query();

        if ($filtroMes && $filtroAnio) {
            $queryPlanillasActivas->where('month', $filtroMes)->where('year', $filtroAnio);
            $queryPlanillasAprobadas->where('month', $filtroMes)->where('year', $filtroAnio);

            $payrollIds = Payroll::where('month', $filtroMes)->where('year', $filtroAnio)->pluck('id');
            $queryDeducciones->whereIn('payroll_id', $payrollIds);
            $queryNeto->whereIn('payroll_id', $payrollIds);
        }

        $planillasActivas = $queryPlanillasActivas->count();
        $planillasAprobadas = $queryPlanillasAprobadas->count();
        $totalDeducciones = $queryDeducciones->sum('total_deductions');
        $netoMensual = $queryNeto->sum('net_salary');

        $ultimasPlanillasQuery = Payroll::with(['level', 'details']);
        if ($filtroMes && $filtroAnio) {
            $ultimasPlanillasQuery->where('month', $filtroMes)->where('year', $filtroAnio);
        }
        $ultimasPlanillas = $ultimasPlanillasQuery->orderBy('id', 'desc')->take(5)->get();

        return view('dashboard', compact(
            'totalEmpleados',
            'planillasActivas',
            'planillasAprobadas',
            'totalDeducciones',
            'netoMensual',
            'ultimasPlanillas',
            'periodosDisponibles',
            'mesesEspanol',
            'filtroMes',
            'filtroAnio'
        ));
    }
}
