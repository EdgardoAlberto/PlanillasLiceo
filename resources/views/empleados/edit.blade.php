@extends('layouts.admin')
@section('title', 'Editar Empleado')

@section('content')
<div class="d-flex justify-content-between align-items-center mb-4">
    <h2 class="h4 text-secondary mb-0">Editar Empleado: {{ $empleado->first_name }} {{ $empleado->last_name }}</h2>
    <a href="{{ url('/empleados') }}" class="btn btn-outline-secondary"><i class="fa fa-arrow-left me-1"></i> Volver</a>
</div>

<div class="card shadow-sm border-0">
    <div class="card-body p-4">
        @if ($errors->any())
            <div class="alert alert-danger">
                <ul class="mb-0">
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif
        
        <form action="{{ url('/empleados/'.$empleado->id) }}" method="POST">
            @csrf
            @method('PUT')
            <h5 class="text-theme mb-3 border-bottom pb-2">Datos Personales y Laborales</h5>
            <div class="row g-3">
                <div class="col-md-3">
                    <label class="form-label">Código Empleado *</label>
                    <input type="text" name="employee_code" class="form-control" value="{{ old('employee_code', $empleado->employee_code) }}" required>
                </div>
                <div class="col-md-3">
                    <label class="form-label">DNI *</label>
                    <input type="text" name="dni" class="form-control" value="{{ old('dni', $empleado->dni) }}" required>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Nombres *</label>
                    <input type="text" name="first_name" class="form-control" value="{{ old('first_name', $empleado->first_name) }}" required>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Apellidos *</label>
                    <input type="text" name="last_name" class="form-control" value="{{ old('last_name', $empleado->last_name) }}" required>
                </div>
                
                <div class="col-md-3">
                    <label class="form-label">Nivel Asignado *</label>
                    <select name="level_id" class="form-select" required>
                        <option value="">Seleccione un nivel...</option>
                        @foreach($niveles as $nivel)
                            <option value="{{ $nivel->id }}" {{ old('level_id', $empleado->level_id) == $nivel->id ? 'selected' : '' }}>{{ $nivel->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Sueldo Base (L.) *</label>
                    <input type="number" step="0.01" name="base_salary" class="form-control" value="{{ old('base_salary', $empleado->base_salary) }}" required>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Fecha de Ingreso</label>
                    <input type="date" name="hire_date" class="form-control" value="{{ old('hire_date', $empleado->hire_date) }}">
                </div>
                <div class="col-md-3">
                    <label class="form-label">Estado *</label>
                    <select name="status" class="form-select" required>
                        <option value="Activo" {{ old('status', $empleado->status) == 'Activo' ? 'selected' : '' }}>Activo</option>
                        <option value="Inactivo" {{ old('status', $empleado->status) == 'Inactivo' ? 'selected' : '' }}>Inactivo</option>
                    </select>
                </div>
                
                <h5 class="text-theme mt-4 mb-3 border-bottom pb-2">Datos Bancarios y Contacto</h5>
                <div class="col-md-3">
                    <label class="form-label">Nombre Banco</label>
                    <input type="text" name="bank_name" class="form-control" value="{{ old('bank_name', $empleado->bank_name) }}">
                </div>
                <div class="col-md-3">
                    <label class="form-label">Cuenta Bancaria *</label>
                    <input type="text" name="bank_account" class="form-control" value="{{ old('bank_account', $empleado->bank_account) }}" required>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Número IHSS</label>
                    <input type="text" name="ihss_number" class="form-control" value="{{ old('ihss_number', $empleado->ihss_number) }}">
                </div>
                <div class="col-md-3">
                    <label class="form-label">Teléfono</label>
                    <input type="text" name="phone" class="form-control" value="{{ old('phone', $empleado->phone) }}">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Correo Electrónico</label>
                    <input type="email" name="email" class="form-control" value="{{ old('email', $empleado->email) }}">
                </div>
            </div>
            
            <div class="mt-4 text-end">
                <button type="submit" class="btn btn-theme px-4 fw-bold"><i class="fa fa-save mt-1"></i> Actualizar Empleado</button>
            </div>
        </form>
    </div>
</div>
@endsection
