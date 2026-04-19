<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Consolidado Bancario {{ ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'][$month - 1] }}/{{ $year }}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { font-family: 'Arial', sans-serif; font-size: 14px; background: #fff; }
        .report-header { text-align: center; margin-bottom: 30px; margin-top: 20px; }
        .table th { background-color: #f8f9fa !important; font-weight: bold; border-bottom: 2px solid #333; }
        @media print {
            body { padding: 0 !important; margin: 0 !important; }
            .btn-print { display: none; }
            @page { size: legal; margin: 15mm; }
        }
    </style>
</head>
<body class="p-4">

    <div class="text-end btn-print">
        <button onclick="window.print()" class="btn btn-primary"><i class="fa fa-print"></i> Imprimir Reporte Bancario</button>
        <button onclick="window.close()" class="btn btn-secondary">Cerrar</button>
    </div>

    <div class="report-header" style="position: relative;">
        <img src="{{ asset('img/logo.png') }}" style="max-height: 2cm; max-width: 2cm; position: absolute; left: 0; top: 0;">
        <h2 class="mb-1 fw-bold">{{ \App\Models\Setting::where('key','institution_name')->first()->value ?? 'Instituto Sagrado Corazón' }}</h2>
        <div class="mb-4 d-flex justify-content-between align-items-end">
        <div>
            <h5 class="mb-0 text-secondary">Reporte General de Transferencias Bancarias</h5>
            <p class="mb-0"><strong>Período Aprobado:</strong> {{ ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'][$month - 1] }} / {{ $year }}</p>
        </div>
        </div>
        <p class="text-muted small">Sólo incluye personal de planillas con estado oficial 'Aprobada'.</p>
    </div>

    <table class="table table-sm table-bordered table-striped mt-4">
        <thead>
            <tr class="text-center align-middle">
                <th>Nº</th>
                <th class="text-start">Nombre del Empleado</th>
                <th>DNI</th>
                <th>Cuenta Bancaria</th>
                <th class="text-end">Monto Neto a Transferir</th>
            </tr>
        </thead>
        <tbody>
            @php $totalMonto = 0; @endphp
            @foreach($details as $idx => $det)
            <tr class="align-middle">
                <td class="text-center">{{ $idx + 1 }}</td>
                <td><strong>{{ $det->employee->first_name }}</strong> {{ $det->employee->last_name }}</td>
                <td class="text-center">{{ $det->employee->dni }}</td>
                <td class="text-center">{{ $det->employee->bank_account }}</td>
                <td class="text-end fw-bold">L. {{ number_format($det->net_salary, 2) }}</td>
            </tr>
            @php $totalMonto += $det->net_salary; @endphp
            @endforeach
        </tbody>
        <tfoot class="table-dark">
            <tr>
                <td colspan="4" class="text-end fw-bold">Total de Planilla:</td>
                <td class="text-end fw-bold fs-5">L. {{ number_format($totalMonto, 2) }}</td>
            </tr>
        </tfoot>
    </table>

    <div class="mt-5 pt-5 text-center">
        <p>_____________________________________</p>
        <p class="fw-bold">{{ \App\Models\Setting::where('key','signature_accountant')->first()->value ?? 'ADMINISTRACION Y APOYO Financiera' }}</p>
        <small class="text-muted">Generado el {{ date('d/m/Y H:i') }}</small>
    </div>
</body>
</html>
