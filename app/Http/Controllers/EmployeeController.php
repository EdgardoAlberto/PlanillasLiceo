<?php
namespace App\Http\Controllers;

use App\Models\Employee;
use App\Models\PayrollLevel;
use Illuminate\Http\Request;

class EmployeeController extends Controller
{
    public function index(Request $request)
    {
        $query = Employee::with('level');
        if($request->filled('search')) {
            $s = $request->search;
            $query->where('first_name', 'like', "%$s%")->orWhere('last_name', 'like', "%$s%")->orWhere('dni', 'like', "%$s%");
        }
        $empleados = $query->orderBy('first_name')->orderBy('last_name')->get();
        return view('empleados.index', compact('empleados'));
    }

    public function create()
    {
        $niveles = PayrollLevel::all();
        return view('empleados.create', compact('niveles'));
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'employee_code' => 'required|unique:employees,employee_code',
            'dni' => 'required|unique:employees,dni',
            'first_name' => 'required|max:150',
            'last_name' => 'required|max:150',
            'bank_account' => 'required|max:100',
            'level_id' => 'required|exists:payroll_levels,id',
            'base_salary' => 'required|numeric|min:0',
            'email' => 'nullable|email',
            'ihss_number' => 'nullable',
            'bank_name' => 'nullable',
            'phone' => 'nullable',
            'status' => 'required|in:Activo,Inactivo',
            'hire_date' => 'nullable|date',
            'support_category' => 'nullable|in:Administración,Apoyo',
        ]);

        Employee::create($data);
        return redirect('/empleados')->with('success', 'Empleado registrado exitosamente.');
    }

    public function show($id) { abort(404); }

    public function edit(Employee $empleado)
    {
        $niveles = PayrollLevel::all();
        return view('empleados.edit', compact('empleado', 'niveles'));
    }

    public function update(Request $request, Employee $empleado)
    {
        $data = $request->validate([
            'employee_code' => 'required|unique:employees,employee_code,'.$empleado->id,
            'dni' => 'required|unique:employees,dni,'.$empleado->id,
            'first_name' => 'required',
            'last_name' => 'required',
            'bank_account' => 'required',
            'level_id' => 'required|exists:payroll_levels,id',
            'base_salary' => 'required|numeric|min:0',
            'email' => 'nullable|email',
            'ihss_number' => 'nullable',
            'bank_name' => 'nullable',
            'phone' => 'nullable',
            'status' => 'required|in:Activo,Inactivo',
            'hire_date' => 'nullable|date',
            'support_category' => 'nullable|in:Administración,Apoyo',
        ]);

        $empleado->update($data);

        // Actualizar salarios en planillas borrador
        $draftDetails = \App\Models\PayrollDetail::where('employee_id', $empleado->id)
            ->whereHas('payroll', function($q) {
                $q->where('status', 'Borrador');
            })->get();

        foreach ($draftDetails as $detail) {
            $detail->update([
                'base_salary' => $empleado->base_salary,
                'net_salary' => $empleado->base_salary - $detail->total_deductions
            ]);
        }

        return redirect('/empleados')->with('success', 'Datos del empleado actualizados.');
    }

    public function destroy(Employee $empleado)
    {
        $empleado->update(['status' => 'Inactivo']);
        return redirect('/empleados')->with('success', 'El empleado ha sido marcado como Inactivo.');
    }

    public function import(Request $request)
    {
        $request->validate([
            'file' => 'required|file|mimes:csv,txt|max:4096'
        ]);

        $file = $request->file('file');
        $handle = fopen($file->getRealPath(), "r");
        $header = fgetcsv($handle, 1000, ","); // Skip header

        while (($row = fgetcsv($handle, 1000, ",")) !== false) {
            if (count($row) < 10) continue;
            
            $departamentoName = trim($row[8]);
            $level = \App\Models\PayrollLevel::firstOrCreate(['name' => $departamentoName]);
            
            Employee::updateOrCreate(
                ['dni' => trim($row[1])],
                [
                    'employee_code' => trim($row[0]),
                    'first_name' => trim($row[2]),
                    'last_name' => trim($row[3]),
                    'ihss_number' => isset($row[4]) ? trim($row[4]) : null,
                    'bank_name' => isset($row[5]) ? trim($row[5]) : null,
                    'bank_account' => isset($row[6]) ? trim($row[6]) : null,
                    'email' => isset($row[7]) ? trim($row[7]) : null,
                    'level_id' => $level->id,
                    'base_salary' => floatval(str_replace(',', '', trim($row[9]))),
                    'phone' => isset($row[10]) ? trim($row[10]) : null,
                    'hire_date' => isset($row[11]) && trim($row[11]) != '' ? trim($row[11]) : now()->format('Y-m-d'),
                    'status' => 'Activo'
                ]
            );
        }
        
        fclose($handle);
        return redirect('/empleados')->with('success', 'Empleados importados exitosamente desde el archivo CSV.');
    }
}
