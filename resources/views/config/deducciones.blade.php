@extends('layouts.admin')
@section('title', 'Deducciones y Niveles')

@section('content')
<div class="row">
    <div class="col-md-8">
        <div class="card table-theme mb-4">
            <div class="card-header bg-white p-3 border-0">
                <h6 class="m-0 fw-bold"><i class="fa fa-list text-theme"></i> Deducciones Configúradas</h6>
            </div>
            <div class="card-body p-0">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-light">
                        <tr>
                            <th>Abreviatura</th>
                            <th>Orden</th>
                            <th>Nombre</th>
                            <th>Aplica a Niveles</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($deductions as $d)
                        <tr>
                            <td><strong>{{ $d->abbreviation }}</strong></td>
                            <td class="text-center"><span class="badge bg-secondary">{{ $d->sort_order }}</span></td>
                            <td>{{ $d->name }}</td>
                            <td>
                                @foreach($d->levels as $lvl)
                                    <span class="badge bg-secondary me-1">{{ $lvl->name }}</span>
                                @endforeach
                            </td>
                            <td>{!! $d->is_active ? '<span class="text-success"><i class="fa fa-check-circle"></i> Activo</span>' : '<span class="text-danger"><i class="fa fa-times-circle"></i> Inactivo</span>' !!}</td>
                            <td>
                                <button type="button" class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editModal{{ $d->id }}">
                                    <i class="fa fa-edit"></i>
                                </button>
                            </td>
                        </tr>

                        <!-- Modal Edición -->
                        <div class="modal fade" id="editModal{{ $d->id }}" tabindex="-1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header border-0">
                                        <h5 class="modal-title">Editar Deducción</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="{{ url('/config/deducciones/'.$d->id) }}" method="POST">
                                            @csrf
                                            @method('PUT')
                                            <div class="mb-3">
                                                <label>Abreviatura</label>
                                                <input type="text" name="abbreviation" class="form-control" value="{{ $d->abbreviation }}" required>
                                            </div>
                                            <div class="mb-3">
                                                <label>Orden Visual (Numérico)</label>
                                                <input type="number" name="sort_order" class="form-control" value="{{ $d->sort_order }}" min="0">
                                            </div>
                                            <div class="mb-3">
                                                <label>Nombre Completo</label>
                                                <input type="text" name="name" class="form-control" value="{{ $d->name }}" required>
                                            </div>
                                            <div class="mb-3">
                                                <label>Estado</label>
                                                <select name="is_active" class="form-select">
                                                    <option value="1" {{ $d->is_active ? 'selected' : '' }}>Activo</option>
                                                    <option value="0" {{ !$d->is_active ? 'selected' : '' }}>Inactivo</option>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label>Asignado a Niveles:</label>
                                                <div class="row">
                                                    @foreach($niveles as $nivel)
                                                    <div class="col-6">
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" name="levels[]" value="{{ $nivel->id }}" {{ $d->levels->contains($nivel->id) ? 'checked' : '' }}>
                                                            <label class="form-check-label">{{ $nivel->name }}</label>
                                                        </div>
                                                    </div>
                                                    @endforeach
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-theme w-100">Guardar Cambios</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    <div class="col-md-4">
        <div class="card shadow-sm border-0">
            <div class="card-header bg-theme text-white border-0 py-3">
                <h6 class="m-0 fw-bold"><i class="fa fa-plus-circle"></i> Nueva Deducción</h6>
            </div>
            <div class="card-body">
                <form action="{{ url('/config/deducciones') }}" method="POST">
                    @csrf
                    <div class="mb-3">
                        <label>Abreviatura *</label>
                        <input type="text" name="abbreviation" class="form-control" placeholder="Ej: IHSS" required>
                    </div>
                    <div class="mb-3">
                        <label>Orden Numérico (Prioridad)</label>
                        <input type="number" name="sort_order" class="form-control" value="0" min="0">
                        <small class="text-muted d-block mb-2">Sirve para ordenar visualmente las columnas (1 primero, luego 2, etc).</small>
                    </div>
                    <div class="mb-3">
                        <label>Nombre Completo *</label>
                        <input type="text" name="name" class="form-control" placeholder="Seguro Social" required>
                    </div>
                    <div class="mb-3">
                        <label>Asignar a Niveles:</label><br>
                        <small class="text-muted mb-2 d-block">Marque los niveles donde esta deducción será obligatoria en la planilla.</small>
                        @foreach($niveles as $nivel)
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="levels[]" value="{{ $nivel->id }}" id="nv_{{ $nivel->id }}">
                            <label class="form-check-label" for="nv_{{ $nivel->id }}">{{ $nivel->name }}</label>
                        </div>
                        @endforeach
                    </div>
                    <hr>
                    <button type="submit" class="btn btn-theme w-100">Registrar Deducción</button>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
