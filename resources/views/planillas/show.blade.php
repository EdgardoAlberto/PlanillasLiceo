@extends('layouts.admin')
@section('title', 'Detalle Planilla')

@section('content')
<div class="d-flex justify-content-between align-items-center mb-4">
    <h2 class="h4 text-secondary mb-0">Planilla: {{ $planilla->level->name }} ({{ $planilla->period_name }})</h2>
    <div>
        <a href="{{ url('/planillas') }}" class="btn btn-outline-secondary me-2"><i class="fa fa-arrow-left"></i> Volver</a>
        <a href="{{ url('/planillas/'.$planilla->id.'/vouchers') }}" target="_blank" class="btn btn-outline-primary me-2"><i class="fa fa-receipt"></i> Imprimir Vouchers</a>
        <button class="btn btn-outline-danger" onclick="window.print()"><i class="fa fa-file-pdf"></i> Imprimir</button>
    </div>
</div>

<div class="row mb-4 d-print-none">
    <div class="col-md-8">
        <div class="card border-0 shadow-sm h-100">
            <div class="card-body py-4">
                <h6 class="text-muted text-uppercase mb-3">Progreso de Autorización</h6>
                <div class="d-flex align-items-center justify-content-between h-75 px-3">
                    <div class="text-center">
                        <div class="rounded-circle bg-success text-white d-inline-flex justify-content-center align-items-center mb-2" style="width:40px;height:40px"><i class="fa fa-check"></i></div>
                        <br><small>Borrador<br>({{ $planilla->creator->name ?? 'Sistema' }})</small>
                    </div>
                
                    <div style="flex:1;height:2px;background:#ddd;margin:0 15px;margin-top:-20px;"></div>
                    
                    <div class="text-center">
                        <div class="rounded-circle {{ $planilla->status != 'Borrador' ? 'bg-success' : 'bg-secondary' }} text-white d-inline-flex justify-content-center align-items-center mb-2" style="width:40px;height:40px"><i class="fa fa-search"></i></div>
                        <br><small>Revisada<br>{!! $planilla->reviewer ? '('.$planilla->reviewer->name.')' : '' !!}</small>
                    </div>

                    <div style="flex:1;height:2px;background:#ddd;margin:0 15px;margin-top:-20px;"></div>

                    <div class="text-center">
                        <div class="rounded-circle {{ in_array($planilla->status, ['Aprobada', 'Enviada']) ? 'bg-success' : 'bg-secondary' }} text-white d-inline-flex justify-content-center align-items-center mb-2" style="width:40px;height:40px"><i class="fa fa-stamp"></i></div>
                        <br><small>Aprobada<br>{!! $planilla->approver ? '('.$planilla->approver->name.')' : '' !!}</small>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card border-0 shadow-sm h-100">
            <div class="card-body">
                <h6 class="text-muted text-uppercase mb-3">Acciones de Estado</h6>
                <form action="{{ url('/planillas/'.$planilla->id.'/estado') }}" method="POST">
                    @csrf
                    @if($planilla->status == 'Borrador')
                        <p class="small text-muted mb-2">Edite deducciones abajo. Una vez listo, proceda a la revisión.</p>
                        <button type="submit" name="status" value="Revisada" class="btn btn-info w-100 fw-bold">Pasa a estado: Revisada</button>
                    @elseif($planilla->status == 'Revisada')
                        <p class="small text-muted mb-2">La planilla espera aprobación definitiva por la Religiosa o el Administrador.</p>
                        @if(in_array(auth()->user()->role->name, ['Administrador', 'Religiosa']))
                            <button type="submit" name="status" value="Aprobada" class="btn btn-success w-100 fw-bold mb-2">Aprobar Planilla Definitivamente</button>
                        @endif
                        @if(auth()->user()->role->name === 'Administrador' || auth()->user()->role->name === 'Contadora')
                            <button type="submit" name="status" value="Borrador" class="btn btn-outline-danger w-100 btn-sm">Devolver a Borrador</button>
                        @endif
                    @elseif($planilla->status == 'Aprobada')
                        <div class="alert alert-success mb-2 py-2"><i class="fa fa-check-circle"></i> Aprobada Oficialmente.</div>
                        @if(auth()->user()->role->name === 'Administrador')
                            <button type="submit" name="status" value="Borrador" class="btn btn-outline-danger w-100 btn-sm mt-2" onclick="return confirm('ATENCIÓN: Revertir una planilla aprobada puede causar inconsistencias. ¿Continuar?');">Revertir a Borrador (Solo Admin)</button>
                        @endif
                    @endif
                </form>
            </div>
        </div>
    </div>
</div>

<div class="card table-theme printable-section">
    <div class="card-header bg-white p-3 border-0 d-flex justify-content-between align-items-center d-print-none">
        <h6 class="m-0 fw-bold">Desglose General</h6>
        @if($planilla->status == 'Borrador')
        <div>
            <form action="{{ url('/planillas/'.$planilla->id.'/sync-salarios') }}" method="POST" class="d-inline">
                @csrf
                <button type="submit" class="btn btn-sm btn-info me-2" onclick="return confirm('¿Actualizar los salarios base y agregar nuevos empleados a esta planilla?');"><i class="fa fa-sync"></i> Sincronizar Planilla</button>
            </form>
            <button form="form-deducciones" type="submit" class="btn btn-sm btn-warning-theme"><i class="fa fa-save"></i> Guardar Deducciones</button>
        </div>
        @endif
    </div>
    
    <div class="d-none d-print-block mt-3 mb-4 position-relative">
        <div class="position-absolute" style="left: 0; top: 0;">
            <img src="{{ asset('img/logo.png') }}" style="max-height: 2cm; max-width: 2cm;">
        </div>
        <div class="text-center w-100">
            <h4>{{ \App\Models\Setting::where('key','institution_name')->first()->value ?? 'Liceo Hondureño' }}</h4>
            <h5>Planilla de {{ $planilla->level->name }} - {{ $planilla->period_name }}</h5>
        </div>
    </div>

    <div class="card-body p-0">
        <form id="form-deducciones" action="{{ url('/planillas/'.$planilla->id.'/deducciones') }}" method="POST">
            @csrf
            <div class="table-responsive" style="max-height: 60vh; overflow-y: auto;">
                <table class="table table-bordered table-hover mb-0 planilla-grid">
                    <thead class="table-light sticky-top">
                        <tr class="align-middle">
                            <th class="text-center px-1" style="width: 1%; white-space: nowrap;">#</th>
                            <th class="d-print-none text-center">DNI</th>
                            <th class="text-start">Empleado</th>
                            <th class="text-center px-1">Sueldo Base</th>
                            <!-- Deductions -->
                            @foreach($deductionsList as $dType)
                                <th class="text-center text-danger px-1" title="{{ $dType->name }}">{{ $dType->abbreviation }}</th>
                            @endforeach
                            <th class="text-center text-danger bg-light px-1">Total Deducido</th>
                            <th class="text-center text-success bg-light fw-bold px-1">Neto a Recibir</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php $counter = 1; @endphp
                        @foreach($planilla->details->sortBy(function($d) { 
                            $prefix = '';
                            if ($d->employee->support_category === 'Administración') $prefix = '1_';
                            elseif ($d->employee->support_category === 'Apoyo') $prefix = '2_';
                            else $prefix = '3_';
                            return $prefix . $d->employee->first_name . ' ' . $d->employee->last_name; 
                        }) as $detail)
                        <tr class="align-middle">
                            <td class="text-center px-1" style="width: 1%; white-space: nowrap;">{{ $counter++ }}</td>
                            <td class="text-center d-print-none">{{ $detail->employee->dni }}</td>
                            <td class="text-start">
                                {{ $detail->employee->first_name }} {{ $detail->employee->last_name }}
                                @if($planilla->status == 'Borrador')
                                    <button type="button" class="btn btn-sm text-danger border-0 p-0 ms-2 d-print-none" onclick="deleteDetail('{{ url('/planillas/'.$planilla->id.'/detalle/'.$detail->id) }}')" title="Remover empleado de esta planilla"><i class="fa fa-times-circle"></i></button>
                                @endif
                            </td>
                            <td class="text-end px-1">L. {{ number_format($detail->base_salary, 2) }}</td>
                            
                            @foreach($deductionsList as $dType)
                                @php
                                    $dObj = $detail->deductions->firstWhere('deduction_type_id', $dType->id);
                                    $amt = $dObj ? $dObj->amount : 0;
                                @endphp
                                <td class="text-end px-1 align-middle">
                                    @if($planilla->status == 'Borrador')
                                    <input type="text" inputmode="decimal" name="deductions[{{ $detail->id }}][{{ $dType->id }}]" class="form-control form-control-sm text-end border-0 px-1 m-0 w-100 d-print-none" value="{{ number_format($amt, 2) }}" onfocus="this.value = this.value.replace(/,/g, '')" onblur="let v = parseFloat(this.value.replace(/,/g, '')); if(isNaN(v)) v = 0; this.value = v.toLocaleString('en-US', {minimumFractionDigits: 2, maximumFractionDigits: 2});">
                                    <span class="d-none d-print-block">{{ number_format($amt, 2) }}</span>
                                    @else
                                    {{ number_format($amt, 2) }}
                                    @endif
                                </td>
                            @endforeach
                            
                            <td class="text-end text-danger bg-light fw-bold px-1">L. {{ number_format($detail->total_deductions, 2) }}</td>
                            <td class="text-end text-success bg-light fw-bold fs-6 px-1">L. {{ number_format($detail->net_salary, 2) }}</td>
                        </tr>
                        @endforeach
                    </tbody>
                    <tfoot class="table-dark sticky-bottom">
                        <tr>
                            <td colspan="3" class="text-end fw-bold d-print-none">TOTALES GLOBALES:</td>
                            <td colspan="2" class="text-end fw-bold d-none d-print-table-cell">TOTALES GLOBALES:</td>
                            <td class="text-end fw-bold px-1">L. {{ number_format($planilla->details->sum('base_salary'), 2) }}</td>
                            @foreach($deductionsList as $dType)
                                @php
                                    $colTotal = 0;
                                    foreach($planilla->details as $det) {
                                        $dObj = $det->deductions->firstWhere('deduction_type_id', $dType->id);
                                        if($dObj) $colTotal += $dObj->amount;
                                    }
                                @endphp
                                <td class="text-end fw-bold px-1">{{ number_format($colTotal, 2) }}</td>
                            @endforeach
                            <td class="text-end fw-bold text-danger px-1">L. {{ number_format($planilla->details->sum('total_deductions'), 2) }}</td>
                            <td class="text-end fw-bold text-warning fs-5 px-1">L. {{ number_format($planilla->details->sum('net_salary'), 2) }}</td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </form>
    </div>
    
    <div class="d-none d-print-block mt-5 pt-5 pb-5">
        <div class="row">
            <div class="col-6 text-center">
                <div style="font-weight: bold; font-size: 14px;">APROBADO POR <span style="display:inline-block; width: 220px; border-bottom: 1px solid #000; margin-left: 10px;"></span></div>
            </div>
            <div class="col-6 text-center">
                <div style="font-weight: bold; font-size: 14px;">AUTORIZADO POR <span style="display:inline-block; width: 220px; border-bottom: 1px solid #000; margin-left: 10px;"></span></div>
            </div>
        </div>
    </div>
</div>

<form id="delete-detail-form" method="POST" action="" style="display:none;">
    @csrf
    @method('DELETE')
</form>

<script>
function deleteDetail(url) {
    if(confirm('¿Está seguro de remover a este empleado únicamente de esta planilla?\n\n(Esto no borra al empleado del sistema, solo lo quita de este pago en borrador).')) {
        let f = document.getElementById('delete-detail-form');
        f.action = url;
        f.submit();
    }
}
</script>

<style>
    /* Estilos globales para la planilla (Pantalla y Reporte) */
    .planilla-grid, .planilla-grid td, .planilla-grid th {
        font-family: 'Arial Unicode MS', 'Arial Unicode', Arial, sans-serif !important; 
        font-size: 9pt !important;
    }
    .planilla-grid th {
        white-space: normal !important; 
        min-width: 60px;
        padding: 0.3rem !important;
    }
    .planilla-grid td {
        white-space: nowrap !important;
        padding: 0.3rem !important;
    }
    /* Maximizar el ancho de pantalla ocultando el padding de Bootstrap */
    @media screen {
        .container-fluid.px-4 { padding-left: 0.2rem !important; padding-right: 0.2rem !important; }
        .card-body { padding: 0.2rem !important; }
    }

@media print {
    @page { size: 13in 8.5in; margin: 4mm; }
    body, h4, h5, p { 
        font-family: 'Arial Unicode MS', 'Arial Unicode', Arial, sans-serif !important; 
        color: #000 !important;
    }
    .planilla-grid td, .planilla-grid th, .bg-light, .bg-dark, .table-dark, .table-light, .text-danger, .text-success, .text-warning, .text-secondary { 
        color: #000 !important; 
        background-color: transparent !important;
    }
    .planilla-grid {
        border-collapse: collapse !important;
        border: 1px solid #000 !important;
    }
    .planilla-grid td, .planilla-grid th { 
        padding: 0.15rem 0.3rem !important; 
        border: 1px solid #000 !important;
    }
    body * { visibility: hidden; }
    .printable-section, .printable-section * { visibility: visible; }
    .printable-section { position: absolute; left: 0; top: 0; width: 100%; }
    .table-responsive { max-height: none !important; overflow: visible !important; }
}
</style>
@endsection
