@extends('layouts.admin')
@section('title', 'Generar Planilla')

@section('content')
<div class="d-flex justify-content-between align-items-center mb-4">
    <h2 class="h4 text-secondary mb-0">Generar Nueva Planilla</h2>
    <a href="{{ url('/planillas') }}" class="btn btn-outline-secondary"><i class="fa fa-arrow-left me-1"></i> Volver</a>
</div>

<div class="card shadow-sm border-0 col-md-6 mx-auto">
    <div class="card-body p-4">
        <form action="{{ url('/planillas') }}" method="POST">
            @csrf
            <div class="mb-3">
                <label class="form-label">Mes *</label>
                <select name="month" class="form-select" required>
                    @for($i=1; $i<=12; $i++)
                        <option value="{{ $i }}" {{ date('n') == $i ? 'selected' : '' }}>{{ ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'][$i - 1] }}</option>
                    @endfor
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Año *</label>
                <input type="number" name="year" class="form-control" value="{{ date('Y') }}" required min="2020" max="2050">
            </div>
            <div class="mb-4">
                <label class="form-label">Nivel de Personal *</label>
                <select name="level_id" class="form-select" required>
                    <option value="">Seleccione Nivel...</option>
                    @foreach($niveles as $nivel)
                        <option value="{{ $nivel->id }}">{{ $nivel->name }}</option>
                    @endforeach
                </select>
            </div>
            
            <div class="alert alert-info">
                <i class="fa fa-info-circle me-1"></i> 
                <strong>Automatización activa:</strong> Las deducciones se copiarán automáticamente de la planilla del mes anterior para el mismo nivel de empleados.
            </div>
            
            <div class="text-end mt-4">
                <button type="submit" class="btn btn-theme px-4 fw-bold"><i class="fa fa-cogs mt-1"></i> Pre-generar Borrador</button>
            </div>
        </form>
    </div>
</div>
@endsection
