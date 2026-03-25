@extends('layouts.admin')
@section('title', 'Usuarios del Sistema')

@section('content')
<div class="row">
    <div class="col-md-8">
        <div class="card table-theme mb-4">
            <div class="card-header bg-white p-3 border-0">
                <h6 class="m-0 fw-bold"><i class="fa fa-users text-theme"></i> Usuarios Configurados</h6>
            </div>
            <div class="card-body p-0">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-light">
                        <tr>
                            <th>Nombre</th>
                            <th>Correo Electrónico</th>
                            <th>Rol Asignado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($users as $user)
                        <tr>
                            <td><strong>{{ $user->name }}</strong></td>
                            <td>{{ $user->email }}</td>
                            <td><span class="badge bg-secondary">{{ $user->role->name ?? 'Sin Rol' }}</span></td>
                            <td>
                                <button type="button" class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editModal{{ $user->id }}">
                                    <i class="fa fa-edit"></i>
                                </button>
                                @if(auth()->id() !== $user->id)
                                <form action="{{ url('/config/usuarios/'.$user->id) }}" method="POST" class="d-inline">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-sm btn-outline-danger" onclick="return confirm('¿Seguro de eliminar este usuario?')">
                                        <i class="fa fa-trash"></i>
                                    </button>
                                </form>
                                @endif
                            </td>
                        </tr>

                        <!-- Modal Edición -->
                        <div class="modal fade" id="editModal{{ $user->id }}" tabindex="-1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header border-0">
                                        <h5 class="modal-title">Editar Usuario</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="{{ url('/config/usuarios/'.$user->id) }}" method="POST">
                                            @csrf
                                            @method('PUT')
                                            <div class="mb-3">
                                                <label>Nombre Completo</label>
                                                <input type="text" name="name" class="form-control" value="{{ $user->name }}" required>
                                            </div>
                                            <div class="mb-3">
                                                <label>Correo Electrónico</label>
                                                <input type="email" name="email" class="form-control" value="{{ $user->email }}" required>
                                            </div>
                                            <div class="mb-3">
                                                <label>Rol del Sistema</label>
                                                <select name="role_id" class="form-select" required>
                                                    @foreach($roles as $role)
                                                    <option value="{{ $role->id }}" {{ $user->role_id == $role->id ? 'selected' : '' }}>{{ $role->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label>Nueva Contraseña (Dejar en blanco para no cambiar)</label>
                                                <input type="password" name="password" class="form-control">
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
                <h6 class="m-0 fw-bold"><i class="fa fa-user-plus"></i> Nuevo Usuario</h6>
            </div>
            <div class="card-body">
                <form action="{{ url('/config/usuarios') }}" method="POST">
                    @csrf
                    <div class="mb-3">
                        <label>Nombre Completo *</label>
                        <input type="text" name="name" class="form-control" value="{{ old('name') }}" required>
                    </div>
                    <div class="mb-3">
                        <label>Correo Electrónico *</label>
                        <input type="email" name="email" class="form-control" value="{{ old('email') }}" required>
                    </div>
                    <div class="mb-3">
                        <label>Rol del Sistema *</label>
                        <select name="role_id" class="form-select" required>
                            <option value="">Seleccione rol...</option>
                            @foreach($roles as $role)
                            <option value="{{ $role->id }}" {{ old('role_id') == $role->id ? 'selected' : '' }}>{{ $role->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="mb-3">
                        <label>Contraseña Acceso *</label>
                        <input type="password" name="password" class="form-control" required>
                    </div>
                    <hr>
                    <button type="submit" class="btn btn-theme w-100">Registrar Usuario</button>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
