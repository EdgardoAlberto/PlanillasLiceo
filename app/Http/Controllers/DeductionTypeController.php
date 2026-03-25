<?php
namespace App\Http\Controllers;

use App\Models\DeductionType;
use App\Models\PayrollLevel;
use Illuminate\Http\Request;

class DeductionTypeController extends Controller
{
    public function index()
    {
        $deductions = DeductionType::with('levels')->orderBy('sort_order')->get();
        $niveles = PayrollLevel::all();
        return view('config.deducciones', compact('deductions', 'niveles'));
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|max:100',
            'abbreviation' => 'required|max:50',
            'levels' => 'nullable|array',
            'sort_order' => 'nullable|integer'
        ]);

        $d = DeductionType::create([
            'name' => $data['name'],
            'abbreviation' => $data['abbreviation'],
            'sort_order' => $data['sort_order'] ?? 0,
            'is_active' => true
        ]);

        if (isset($data['levels'])) {
            $d->levels()->sync($data['levels']);
        }

        return back()->with('success', 'Deducción registrada exitosamente.');
    }

    public function update(Request $request, DeductionType $deduccion)
    {
        $data = $request->validate([
            'name' => 'required|max:100',
            'abbreviation' => 'required|max:50',
            'levels' => 'nullable|array',
            'is_active' => 'required|boolean',
            'sort_order' => 'nullable|integer'
        ]);

        $deduccion->update([
            'name' => $data['name'],
            'abbreviation' => $data['abbreviation'],
            'is_active' => $data['is_active'],
            'sort_order' => $data['sort_order'] ?? 0
        ]);

        if (isset($data['levels'])) {
            $deduccion->levels()->sync($data['levels']);
        } else {
            $deduccion->levels()->sync([]);
        }

        return back()->with('success', 'Deducción actualizada exitosamente.');
    }
}
