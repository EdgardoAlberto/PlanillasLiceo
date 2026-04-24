<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - {{ config('app.name', 'Planillas Liceo') }}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/admin.css" rel="stylesheet">
    <style>
        body {
            background: #112D4E;
            display: flex;
            align-items: center;
            min-height: 100vh;
        }

        .login-card {
            border-radius: 10px;
            border-top: 5px solid #198754;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="card login-card">
                    <div class="card-body p-5">
                        <div class="text-center mb-4">
                            <h3 class="fw-bold" style="color: #112D4E;">Liceo Hondureño</h3>
                            <p class="text-muted">Sistema de Planillas</p>
                        </div>
                        @if ($errors->any())
                            <div class="alert alert-danger p-2"><small>{{ $errors->first() }}</small></div>
                        @endif
                        <form method="POST" action="{{ url('/login') }}">
                            @csrf
                            <div class="mb-3">
                                <label class="form-label">Correo Electrónico</label>
                                <input type="email" name="email" class="form-control" required autofocus>
                            </div>
                            <div class="mb-4">
                                <label class="form-label">Contraseña</label>
                                <input type="password" name="password" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-theme w-100 fw-bold py-2">Ingresar al Sistema</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>