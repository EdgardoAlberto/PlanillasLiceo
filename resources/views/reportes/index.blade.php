@extends('layouts.admin')
@section('title', 'Centro de Reportes')

@section('content')
<div class="d-flex justify-content-between align-items-center mb-4">
    <h2 class="h4 text-secondary mb-0"><i class="fa fa-chart-line text-theme me-2"></i>Centro de Reportes</h2>
</div>

<div class="row">
    <!-- Reporte Consolidado Bancario -->
    <div class="col-md-6 mb-4">
        <div class="card shadow-sm border-0 h-100">
            <div class="card-header bg-white border-0 pt-4 pb-0">
                <h5 class="fw-bold text-theme"><i class="fa fa-university me-2"></i> Consolidado Bancario</h5>
                <p class="text-muted small">Genera un listado alfabético de todos los empleados en planillas APROBADAS para emisión de pagos bancarios.</p>
            </div>
            <div class="card-body">
                <form action="{{ url('/reportes/bancario') }}" method="GET" target="_blank">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold">Mes</label>
                            <select name="month" class="form-select" required>
                                @for($i=1; $i<=12; $i++)
                                    <option value="{{ $i }}" {{ date('n') == $i ? 'selected' : '' }}>{{ ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'][$i - 1] }}</option>
                                @endfor
                            </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold">Año</label>
                            <input type="number" name="year" class="form-control" value="{{ date('Y') }}" required min="2020" max="2050">
                        </div>
                    </div>
                    <button type="submit" name="tipo" value="detallado" class="btn btn-outline-primary w-100 mb-2"><i class="fa fa-file-invoice text-primary me-1"></i> Generar Reporte Detallado</button>
                    <button type="submit" name="tipo" value="simple" class="btn btn-outline-info w-100"><i class="fa fa-list text-info me-1"></i> Generar Reporte Simple (Sin Subtotales)</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Reporte Histórico Empleado -->
    <div class="col-md-6 mb-4">
        <div class="card shadow-sm border-0 h-100">
            <div class="card-header bg-white border-0 pt-4 pb-0">
                <h5 class="fw-bold text-success"><i class="fa fa-history me-2"></i> Historial por Empleado</h5>
                <p class="text-muted small">Busque un empleado para visualizar toda su trayectoria de pagos y desglose de deducciones mensuales.</p>
            </div>
            <div class="card-body">
                <form action="{{ url('/reportes/historico') }}" method="GET" target="_blank">
                    <div class="row mb-3">
                        <div class="col-md-12 mb-3">
                            <label class="form-label fw-bold">Seleccionar Empleado</label>
                            <select name="employee_id" class="form-select" required>
                                <option value="">Buscar...</option>
                                @foreach($empleados as $emp)
                                    <option value="{{ $emp->id }}">{{ $emp->first_name }} {{ $emp->last_name }} ({{ $emp->dni }})</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold">Mes (Opcional)</label>
                            <select name="month" class="form-select">
                                <option value="">Todos los meses</option>
                                @for($i=1; $i<=12; $i++)
                                    <option value="{{ $i }}">{{ ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'][$i - 1] }}</option>
                                @endfor
                            </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold">Año (Opcional)</label>
                            <input type="number" name="year" class="form-control" placeholder="Todos" min="2020" max="2050">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-outline-success w-100"><i class="fa fa-folder-open text-success me-1"></i> Ver Expediente de Pagos</button>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
