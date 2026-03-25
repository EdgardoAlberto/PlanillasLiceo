<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Historial de Pagos - {{ $empleado->dni }}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { font-family: 'Arial', sans-serif; font-size: 13px; background: #fff; }
        .report-header { text-align: center; margin-bottom: 30px; margin-top: 20px; }
        .table th { background-color: #f8f9fa !important; font-weight: bold; border-bottom: 2px solid #333; }
        @media print {
            body { padding: 0 !important; margin: 0 !important; }
            .btn-print { display: none; }
        }
    </style>
</head>
<body class="p-4">
    <div class="text-end btn-print d-print-none">
        <button onclick="window.print()" class="btn btn-primary"><i class="fa fa-print"></i> Imprimir Expediente</button>
        <button onclick="window.close()" class="btn btn-secondary">Cerrar</button>
    </div>

    <div class="report-header">
        <h2 class="mb-1 fw-bold">{{ \App\Models\Setting::where('key','institution_name')->first()->value ?? 'Instituto Sagrado Corazón' }}</h2>
        <h4 class="mb-3 text-secondary">Expediente Histórico de Planillas</h4>
        
        <div class="text-start border p-3 bg-light mt-4 mx-auto" style="max-width: 800px;">
            <div class="row">
                <div class="col-6 mb-2"><strong>Empleado:</strong> {{ $empleado->first_name }} {{ $empleado->last_name }}</div>
                <div class="col-6 mb-2"><strong>DNI:</strong> {{ $empleado->dni }}</div>
                <div class="col-6"><strong>Nivel Actual:</strong> {{ $empleado->level->name }}</div>
                <div class="col-6"><strong>Salario Base:</strong> L. {{ number_format($empleado->base_salary, 2) }}</div>
            </div>
        </div>
    </div>

    <h5 class="mt-4 mb-3">Detalle de Pagos Emitidos</h5>
    <table class="table table-sm table-bordered table-striped">
        <thead>
            <tr class="text-center align-middle">
                <th>Período</th>
                <th>Estado Planilla</th>
                <th class="text-end">Sueldo Base</th>
                <th>Desglose de Deducciones</th>
                <th class="text-end text-danger">Total Deducido</th>
                <th class="text-end text-success">Neto Pagado</th>
            </tr>
        </thead>
        <tbody>
            @php $totalNet = 0; $totalDed = 0; @endphp
            @forelse($historico as $det)
            <tr class="align-middle">
                <td class="text-center fw-bold">{{ $det->payroll->period_name }}</td>
                <td class="text-center">
                    <span class="badge {{ $det->payroll->status == 'Aprobada' ? 'bg-success text-white' : 'bg-secondary text-white' }} px-2 py-1">{{ $det->payroll->status }}</span>
                </td>
                <td class="text-end">L. {{ number_format($det->base_salary, 2) }}</td>
                <td>
                    <ul class="mb-0 ps-3" style="font-size: 0.9em;">
                        @foreach($det->deductions as $d)
                            <li><strong>{{ $d->deductionType->abbreviation }}:</strong> L. {{ number_format($d->amount, 2) }}</li>
                        @endforeach
                        @if($det->deductions->isEmpty())
                            <li class="text-muted">Sin deducciones (L. 0.00)</li>
                        @endif
                    </ul>
                </td>
                <td class="text-end fw-bold text-danger">L. {{ number_format($det->total_deductions, 2) }}</td>
                <td class="text-end fw-bold text-success">L. {{ number_format($det->net_salary, 2) }}</td>
            </tr>
            @php 
                if($det->payroll->status == 'Aprobada') {
                    $totalNet += $det->net_salary; 
                    $totalDed += $det->total_deductions;
                }
            @endphp
            @empty
            <tr><td colspan="6" class="text-center py-4">No hay registros históricos para este empleado.</td></tr>
            @endforelse
        </tbody>
        <tfoot class="table-dark">
            <tr>
                <td colspan="4" class="text-end fw-bold">TOTAL ACUMULADO (Aprobadas):</td>
                <td class="text-end fw-bold text-warning">L. {{ number_format($totalDed, 2) }}</td>
                <td class="text-end fw-bold text-success fs-5">L. {{ number_format($totalNet, 2) }}</td>
            </tr>
        </tfoot>
    </table>
</body>
</html>
