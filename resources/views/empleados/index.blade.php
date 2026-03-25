@extends('layouts.admin')
@section('title', 'Empleados')

@section('content')
<div class="d-flex justify-content-between align-items-center mb-4">
    <h2 class="h4 text-secondary mb-0"><i class="fa fa-users text-theme me-2"></i>Gestión de Personal</h2>
    <div>
        <button class="btn btn-outline-success me-2" data-bs-toggle="modal" data-bs-target="#importModal"><i class="fa fa-upload me-1"></i> Importar CSV</button>
        <a href="{{ url('/empleados/create') }}" class="btn btn-theme"><i class="fa fa-plus me-1"></i> Nuevo Empleado</a>
    </div>
</div>

<div class="card table-theme">
    <div class="card-header bg-white p-3 border-0">
        <form action="{{ url('/empleados') }}" method="GET" class="row g-2 align-items-center">
            <div class="col-auto">
                <input type="text" name="search" class="form-control form-control-sm" placeholder="Buscar DNI o Nombre..." value="{{ request('search') }}">
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-sm btn-outline-secondary"><i class="fa fa-search"></i> Buscar</button>
            </div>
            @if(request('search'))
            <div class="col-auto">
                <a href="{{ url('/empleados') }}" class="btn btn-sm btn-link text-danger">Limpiar</a>
            </div>
            @endif
        </form>
    </div>
    <div class="card-body p-0">
        <div class="table-responsive">
            <table class="table table-hover mb-0 align-middle">
                <thead class="table-light">
                    <tr>
                        <th>Código</th>
                        <th>DNI</th>
                        <th>Nombre Completo</th>
                        <th>Nivel</th>
                        <th>Salario Base</th>
                        <th>Estado</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($empleados as $e)
                    <tr>
                        <td><strong>{{ $e->employee_code }}</strong></td>
                        <td>{{ $e->dni }}</td>
                        <td>{{ $e->first_name }} {{ $e->last_name }}</td>
                        <td><span class="badge bg-info text-dark">{{ $e->level->name }}</span></td>
                        <td>L. {{ number_format($e->base_salary, 2) }}</td>
                        <td>
                            @if($e->status == 'Activo') <span class="badge bg-success">Activo</span>
                            @else <span class="badge bg-danger">Inactivo</span> @endif
                        </td>
                        <td class="text-center">
                            <a href="{{ url('/empleados/'.$e->id.'/edit') }}" class="btn btn-sm btn-outline-primary" title="Editar"><i class="fa fa-edit"></i></a>
                            @if($e->status == 'Activo')
                            <form action="{{ url('/empleados/'.$e->id) }}" method="POST" class="d-inline" onsubmit="return confirm('¿Seguro que desea inactivar este empleado?');">
                                @csrf @method('DELETE')
                                <button type="submit" class="btn btn-sm btn-outline-danger" title="Inactivar"><i class="fa fa-ban"></i></button>
                            </form>
                            @endif
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="7" class="text-center text-muted py-4">No se encontraron empleados.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>

<!-- Modal Importar -->
<div class="modal fade" id="importModal" tabindex="-1" aria-labelledby="importModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form action="{{ url('/empleados/import') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="modal-header">
          <h5 class="modal-title" id="importModalLabel">Importar Empleados mediante CSV</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div class="mb-3">
            <label for="file" class="form-label">Archivo de Datos (.csv)</label>
            <input class="form-control" type="file" id="file" name="file" accept=".csv" required>
          </div>
          <small class="text-muted d-block mt-2">
            Asegúrese de usar el formato de tabla proporcionado anteriormente. Las columnas deben ir en el mismo orden: código, identidad, nombres, apellidos, ihss, banco, cuenta, correo, departamento, sueldo base, teléfono y fecha de contratación.
          </small>
          <div class="mt-3 text-center">
            <a href="{{ asset('archivos/Plantilla_Empleados.csv') }}" class="btn btn-sm btn-outline-primary" download><i class="fa fa-download me-1"></i> Descargar Plantilla .CSV de Ejemplo</a>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
          <button type="submit" class="btn btn-success"><i class="fa fa-check me-1"></i> Iniciar Importación</button>
        </div>
      </form>
    </div>
  </div>
</div>
@endsection
