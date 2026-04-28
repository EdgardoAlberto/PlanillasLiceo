<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\PayrollController;
use App\Http\Controllers\DeductionTypeController;
use App\Http\Controllers\SettingController;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\UserController;

Route::get('/', function () {
    return redirect('/login');
});

Route::get('/login', [AuthController::class, 'showLoginForm'])->name('login');
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

Route::middleware('auth')->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
    
    // Rutas para Administrador y Contadora
    Route::middleware('role:Administrador,Contadora')->group(function () {
        // Módulo de Empleados
        Route::post('/empleados/import', [EmployeeController::class, 'import']);
        Route::resource('empleados', EmployeeController::class);
        
        // Módulo de Planillas
        Route::get('/planillas/historial', [PayrollController::class, 'historial']);
        Route::resource('planillas', PayrollController::class)->except(['edit', 'update', 'destroy']);
        Route::get('/planillas/{planilla}/vouchers', [PayrollController::class, 'vouchers']);
        Route::post('/planillas/{planilla}/deducciones', [PayrollController::class, 'updateDeductions']);
        Route::post('/planillas/{planilla}/estado', [PayrollController::class, 'cambiarEstado']);
        Route::delete('/planillas/{planilla}/detalle/{detalle}', [PayrollController::class, 'removeDetail']);

        // Reportes
        Route::get('/reportes', [ReportController::class, 'index']);
        Route::get('/reportes/bancario', [ReportController::class, 'bancario']);
        Route::get('/reportes/historico', [ReportController::class, 'historico']);
    });

    // Rutas solo para Administrador (Configuración)
    Route::middleware('role:Administrador')->group(function () {
        Route::get('/config/deducciones', [DeductionTypeController::class, 'index']);
        Route::post('/config/deducciones', [DeductionTypeController::class, 'store']);
        Route::put('/config/deducciones/{deduccion}', [DeductionTypeController::class, 'update']);
        Route::get('/config/settings', [SettingController::class, 'index']);
        Route::put('/config/settings', [SettingController::class, 'update']);
        Route::get('/config/backup', [SettingController::class, 'backup']);
        Route::post('/config/restore', [SettingController::class, 'restore']);
        
        Route::resource('config/usuarios', UserController::class)->except(['create', 'show', 'edit']);
    });
});
