<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'Dashboard') - {{ config('app.name', 'Planillas Liceo') }}</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Custom CSS -->
    <link href="/css/admin.css" rel="stylesheet">
    @yield('styles')
</head>
<body>
    <div class="wrapper">
        <!-- Sidebar -->
        <nav id="sidebar">
            <div class="sidebar-header d-flex align-items-center">
                <i class="fa fa-graduation-cap fa-2x me-2"></i>
                <h5 class="mb-0">Liceo Hondureño</h5>
            </div>

            <ul class="list-unstyled components">
                <li class="{{ request()->is('dashboard') ? 'active' : '' }}">
                    <a href="{{ url('/dashboard') }}"><i class="fa fa-chart-pie me-2"></i> Dashboard</a>
                </li>
                <li>
                    <a href="#empleadosSubmenu" data-bs-toggle="collapse" class="dropdown-toggle"><i class="fa fa-users me-2"></i> Personal</a>
                    <ul class="collapse list-unstyled {{ request()->is('empleados*') ? 'show' : '' }}" id="empleadosSubmenu">
                        <li><a href="{{ url('/empleados') }}">Listado Empleados</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#planillasSubmenu" data-bs-toggle="collapse" class="dropdown-toggle"><i class="fa fa-file-invoice-dollar me-2"></i> Planillas</a>
                    <ul class="collapse list-unstyled {{ request()->is('planillas*') ? 'show' : '' }}" id="planillasSubmenu">
                        <li><a href="{{ url('/planillas') }}">Generar Planilla</a></li>
                        <li><a href="{{ url('/planillas/historial') }}">Historial Aprobadas</a></li>
                    </ul>
                </li>
                <li class="{{ request()->is('reportes*') ? 'active' : '' }}">
                    <a href="{{ url('/reportes') }}"><i class="fa fa-print me-2"></i> Reportes</a>
                </li>
                
                @if(auth()->check() && auth()->user()->role->name === 'Administrador')
                <li>
                    <a href="#configSubmenu" data-bs-toggle="collapse" class="dropdown-toggle"><i class="fa fa-cogs me-2"></i> Configuración</a>
                    <ul class="collapse list-unstyled {{ request()->is('configuracion*') ? 'show' : '' }}" id="configSubmenu">
                        <li><a href="{{ url('/config/settings') }}">Parámetros Generales</a></li>
                        <li><a href="{{ url('/config/deducciones') }}">Tipos de Deducción</a></li>
                        <li><a href="{{ url('/config/usuarios') }}" class="{{ request()->is('config/usuarios*') ? 'fw-bold text-theme' : '' }}">Usuarios del Sistema</a></li>
                    </ul>
                </li>
                @endif
            </ul>
        </nav>

        <!-- Page Content -->
        <div id="content">
            <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm mb-4">
                <div class="container-fluid">
                    <button type="button" id="sidebarCollapse" class="btn btn-theme">
                        <i class="fas fa-bars"></i>
                    </button>
                    <div class="ms-auto d-flex align-items-center">
                        <span class="me-3 fw-bold text-secondary">
                            <i class="fa fa-user-circle me-1"></i> {{ auth()->user()->name ?? 'Usuario' }} 
                            <small class="badge bg-info text-dark ms-1">{{ auth()->user()->role->name ?? 'Rol' }}</small>
                        </span>
                        <form action="{{ url('/logout') }}" method="POST" class="m-0">
                            @csrf
                            <button type="submit" class="btn btn-sm btn-outline-danger"><i class="fa fa-sign-out-alt"></i> Salir</button>
                        </form>
                    </div>
                </div>
            </nav>

            <div class="container-fluid px-4">
                @if(session('success'))
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="fa fa-check-circle me-2"></i>{{ session('success') }}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                @endif
                @if(session('error'))
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="fa fa-exclamation-triangle me-2"></i>{{ session('error') }}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                @endif

                @if($errors->any())
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="fa fa-exclamation-triangle me-2"></i> <strong>Por favor, corrige los siguientes errores:</strong>
                        <ul class="mb-0 mt-2">
                            @foreach($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                @endif
                
                @yield('content')
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.getElementById('sidebarCollapse').addEventListener('click', function() {
            document.getElementById('sidebar').classList.toggle('active');
            document.getElementById('content').classList.toggle('active');
        });
    </script>
    @yield('scripts')
</body>
</html>
