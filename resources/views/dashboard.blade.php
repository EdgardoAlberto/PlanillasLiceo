@extends('layouts.admin')
@section('title', 'Dashboard')

@section('content')
<div class="d-flex justify-content-between align-items-center mb-4">
    <h2 class="h4 text-secondary mb-0">Resumen General</h2>
    <div class="d-flex align-items-center">
        <form id="filterForm" class="me-3 mb-0">
            <select name="period" class="form-select form-select-sm" onchange="applyFilter(this.value)">
                <option value="">Todos los Meses</option>
                @if(isset($periodosDisponibles))
                    @foreach($periodosDisponibles as $periodo)
                        @php 
                            $val = $periodo->month . '-' . $periodo->year; 
                            $selected = ($filtroMes == $periodo->month && $filtroAnio == $periodo->year) ? 'selected' : '';
                        @endphp
                        <option value="{{ $val }}" {{ $selected }}>{{ $mesesEspanol[$periodo->month] ?? '' }} {{ $periodo->year }}</option>
                    @endforeach
                @endif
            </select>
        </form>
        <span class="text-muted d-none d-sm-inline">{{ now()->translatedFormat('d \d\e F, Y') }}</span>
    </div>
</div>

<script>
function applyFilter(val) {
    if(!val) {
        window.location.href = "{{ url('/dashboard') }}";
        return;
    }
    const parts = val.split('-');
    window.location.href = "{{ url('/dashboard') }}?month=" + parts[0] + "&year=" + parts[1];
}
</script>

<div class="row g-4 mb-4">
    <div class="col-sm-6 col-lg">
        <div class="card kpi-card">
            <div class="card-body d-flex align-items-center justify-content-between">
                <div>
                    <h6 class="text-muted mb-1">Total Empleados</h6>
                    <h3 class="mb-0 fw-bold">{{ $totalEmpleados ?? 0 }}</h3>
                </div>
                <i class="fa fa-users kpi-icon"></i>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-lg">
        <div class="card kpi-card blue-edge">
            <div class="card-body d-flex align-items-center justify-content-between">
                <div>
                    <h6 class="text-muted mb-1">Planillas Activas</h6>
                    <h3 class="mb-0 fw-bold">{{ $planillasActivas ?? 0 }}</h3>
                </div>
                <i class="fa fa-file-invoice-dollar kpi-icon text-primary"></i>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-lg">
        <div class="card kpi-card border-success" style="border-left: 4px solid #198754 !important;">
            <div class="card-body d-flex align-items-center justify-content-between">
                <div>
                    <h6 class="text-muted mb-1">Planillas Aprobadas</h6>
                    <h3 class="mb-0 fw-bold">{{ $planillasAprobadas ?? 0 }}</h3>
                </div>
                <i class="fa fa-check-double kpi-icon text-success"></i>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-lg">
        <div class="card kpi-card yellow-edge">
            <div class="card-body d-flex align-items-center justify-content-between">
                <div>
                    <h6 class="text-muted mb-1">Total Deducciones</h6>
                    <h3 class="mb-0 fw-bold fs-5">L. {{ number_format($totalDeducciones ?? 0, 2) }}</h3>
                </div>
                <i class="fa fa-hand-holding-usd kpi-icon text-warning"></i>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-lg">
        <div class="card kpi-card">
            <div class="card-body d-flex align-items-center justify-content-between">
                <div>
                    <h6 class="text-muted mb-1">Total Neto</h6>
                    <h3 class="mb-0 fw-bold fs-5">L. {{ number_format($netoMensual ?? 0, 2) }}</h3>
                </div>
                <i class="fa fa-money-bill-wave kpi-icon text-success"></i>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-12">
        <div class="card table-theme">
            <div class="card-header bg-white p-3 border-0 d-flex justify-content-between align-items-center">
                <h6 class="m-0 fw-bold">Últimas Planillas Generadas</h6>
                <a href="{{ url('/planillas') }}" class="btn btn-sm btn-outline-secondary">Ver todas</a>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover mb-0">
                        <thead class="table-light">
                            <tr>
                                <th>Período</th>
                                <th>Nivel</th>
                                <th>Estado</th>
                                <th>Neto</th>
                                <th>Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($ultimasPlanillas ?? [] as $p)
                            <tr>
                                <td>{{ $p->period_name }}</td>
                                <td>{{ $p->level->name }}</td>
                                <td>
                                    @if($p->status == 'Borrador') <span class="badge bg-secondary">Borrador</span>
                                    @elseif($p->status == 'Aprobada') <span class="badge bg-success">Aprobada</span>
                                    @else <span class="badge bg-primary">{{ $p->status }}</span> @endif
                                </td>
                                <td>L. {{ number_format($p->details->sum('net_salary'), 2) }}</td>
                                <td>
                                    <a href="{{ url('/planillas/' . $p->id) }}" class="btn btn-sm btn-theme text-white border-0"><i class="fa fa-eye"></i></a>
                                </td>
                            </tr>
                            @empty
                            <tr>
                                <td colspan="5" class="text-center text-muted py-3">No hay planillas recientes.</td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
