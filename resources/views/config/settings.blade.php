@extends('layouts.admin')
@section('title', 'Parámetros del Sistema')

@section('content')
<div class="row justify-content-center">
    <div class="col-md-8">
        <div class="card shadow-sm border-0">
            <div class="card-header bg-white p-4 border-0">
                <h4 class="m-0 fw-bold text-secondary"><i class="fa fa-cogs text-theme me-2"></i> Parámetros e Institución</h4>
            </div>
            <div class="card-body p-4 pt-0">
                <form action="{{ url('/config/settings') }}" method="POST">
                    @csrf
                    @method('PUT')
                    
                    @php
                        $nombres_config = [
                            'institution_name' => 'Nombre de la Institución',
                            'signature_religious' => 'Administradora',
                            'signature_accountant' => 'Firma Contadora'
                        ];
                    @endphp
                    @foreach($settings as $s)
                    <div class="mb-3 row align-items-center">
                        <label class="col-sm-4 col-form-label text-end fw-bold">{{ $nombres_config[$s->key] ?? ucwords(str_replace('_', ' ', $s->key)) }} :</label>
                        <div class="col-sm-8">
                            <input type="text" name="settings[{{ $s->id }}]" class="form-control" value="{{ $s->value }}">
                            @if($s->description)
                            <small class="text-muted">{{ $s->description }}</small>
                            @endif
                        </div>
                    </div>
                    @endforeach
                    
                    <hr>
                    <div class="text-end mt-4">
                        <button type="submit" class="btn btn-theme px-5"><i class="fa fa-save"></i> Guardar Ajustes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="row justify-content-center mt-4">
    <div class="col-md-8">
        <div class="card shadow-sm border-0">
            <div class="card-body p-4 d-flex justify-content-between align-items-center">
                <div>
                    <h5 class="fw-bold mb-1 text-secondary"><i class="fa fa-database text-theme me-2"></i> Respaldo de Base de Datos</h5>
                    <p class="text-muted mb-0 small">Descarga un archivo .sql con toda la información, lista para ser restaurada en caso de emergencia.</p>
                </div>
                <a href="{{ url('/config/backup') }}" class="btn btn-outline-theme fw-bold">
                    <i class="fa fa-download"></i> Descargar SQL
                </a>
            </div>
        </div>
    </div>
</div>

<div class="row justify-content-center mt-4">
    <div class="col-md-8">
        <div class="card shadow-sm border-0 border-top border-3 border-danger">
            <div class="card-body p-4">
                <div class="mb-3">
                    <h5 class="fw-bold mb-1 text-danger"><i class="fa fa-upload me-2"></i> Restaurar Sistema</h5>
                    <p class="text-muted mb-0 small">Sube un archivo de respaldo <strong>.sql</strong>. <span class="text-danger fw-bold">¡Esta acción borrará los datos existentes para reemplazarlos con los del archivo!</span></p>
                </div>
                <form action="{{ url('/config/restore') }}" method="POST" enctype="multipart/form-data" class="d-flex align-items-center">
                    @csrf
                    <input type="file" name="sql_file" class="form-control me-2" accept=".sql" required>
                    <button type="submit" class="btn btn-danger fw-bold text-nowrap" onclick="return confirm('¿Estás absolutamente SEGURO de querer restaurar la base de datos? ¡Todos los datos actuales se borrarán definitivamente!')">
                        <i class="fa fa-refresh"></i> Iniciar Restauración
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
