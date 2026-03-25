<?php
namespace App\Http\Controllers;

use App\Models\Employee;
use App\Models\Payroll;
use App\Models\PayrollDetail;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index() {
        $totalEmpleados = Employee::where('status', 'Activo')->count();
        $planillasActivas = Payroll::where('status', 'Borrador')->orWhere('status', 'Revisada')->count();
        
        $totalDeducciones = PayrollDetail::sum('total_deductions');
        $netoMensual = PayrollDetail::sum('net_salary');

        $ultimasPlanillas = Payroll::with(['level', 'details'])->orderBy('id', 'desc')->take(5)->get();

        return view('dashboard', compact(
            'totalEmpleados', 'planillasActivas', 'totalDeducciones', 'netoMensual', 'ultimasPlanillas'
        ));
    }
}
