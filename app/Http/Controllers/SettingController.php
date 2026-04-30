<?php
namespace App\Http\Controllers;

use App\Models\Setting;
use Illuminate\Http\Request;

class SettingController extends Controller
{
    public function index()
    {
        $settings = Setting::all();
        return view('config.settings', compact('settings'));
    }

    public function update(Request $request)
    {
        if($request->has('settings')) {
            foreach ($request->settings as $id => $val) {
                Setting::where('id', $id)->update(['value' => $val]);
            }
        }
        return back()->with('success', 'Parámetros del sistema guardados correctamente.');
    }

    public function backup()
    {
        $dbName = config('database.connections.mysql.database', env('DB_DATABASE', 'planillas_liceo'));
        $userName = config('database.connections.mysql.username', env('DB_USERNAME', 'root'));
        $password = config('database.connections.mysql.password', env('DB_PASSWORD', ''));
        $host = config('database.connections.mysql.host', env('DB_HOST', '127.0.0.1'));
        $port = config('database.connections.mysql.port', env('DB_PORT', 3306));
        
        $date = now()->format('Y-m-d_H-i-s');
        $filename = "backup_liceo_{$date}.sql";
        $path = storage_path("app/backups/" . $filename);

        if (!file_exists(storage_path('app/backups'))) {
            mkdir(storage_path('app/backups'), 0755, true);
        }

        $possiblePaths = [
            'mysqldump',
            '/usr/bin/mysqldump',
            'E:\xampp\mysql\bin\mysqldump.exe',
            'C:\xampp\mysql\bin\mysqldump.exe'
        ];
        
        $mysqldumpPath = 'mysqldump'; 
        foreach ($possiblePaths as $testPath) {
            if ($testPath !== 'mysqldump' && file_exists($testPath)) {
                $mysqldumpPath = '"' . $testPath . '"';
                break;
            }
        }

        // Pasamos la contraseña por variable de entorno para evitar problemas con caracteres especiales (ej. $) en bash
        putenv("MYSQL_PWD={$password}");
        
        $command = "{$mysqldumpPath} --user=\"{$userName}\" --host=\"{$host}\" --port=\"{$port}\" \"{$dbName}\" > \"{$path}\" 2>&1";
        
        exec($command, $output, $returnVar);
        
        // Limpiamos la variable de entorno por seguridad
        putenv("MYSQL_PWD");

        if ($returnVar === 0 && file_exists($path)) {
            return response()->download($path, $filename, [
                'Content-Type' => 'application/sql',
            ])->deleteFileAfterSend(true);
        } else {
            $errorDetails = empty($output) ? "Código {$returnVar}. Verifica si el cliente mysqldump está instalado." : implode("\n", $output);
            return back()->with('error', 'Falló la creación del respaldo. Detalles del error: ' . $errorDetails);
        }
    }

    public function restore(Request $request)
    {
        $request->validate([
            'sql_file' => 'required|file|mimetypes:text/plain,application/sql,text/x-sql'
        ]);

        $dbName = config('database.connections.mysql.database', env('DB_DATABASE', 'planillas_liceo'));
        $userName = config('database.connections.mysql.username', env('DB_USERNAME', 'root'));
        $password = config('database.connections.mysql.password', env('DB_PASSWORD', ''));
        $host = config('database.connections.mysql.host', env('DB_HOST', '127.0.0.1'));
        $port = config('database.connections.mysql.port', env('DB_PORT', 3306));

        $file = $request->file('sql_file');
        
        // Use a secure temporary file location
        $tempPath = storage_path('app/temp_restore_' . time() . '.sql');
        move_uploaded_file($file->getRealPath(), $tempPath);

        $possiblePaths = [
            'mysql',
            '/usr/bin/mysql',
            'E:\xampp\mysql\bin\mysql.exe',
            'C:\xampp\mysql\bin\mysql.exe'
        ];
        
        $mysqlPath = 'mysql';
        foreach ($possiblePaths as $testPath) {
            if ($testPath !== 'mysql' && file_exists($testPath)) {
                $mysqlPath = '"' . $testPath . '"';
                break;
            }
        }

        putenv("MYSQL_PWD={$password}");
        
        $command = "{$mysqlPath} --user=\"{$userName}\" --host=\"{$host}\" --port=\"{$port}\" \"{$dbName}\" < \"{$tempPath}\" 2>&1";
        
        exec($command, $output, $returnVar);
        
        putenv("MYSQL_PWD");
        
        // Limpiamos el archivo temporal que subió el usuario por seguridad
        if (file_exists($tempPath)) {
            unlink($tempPath);
        }

        if ($returnVar === 0) {
            return back()->with('success', 'La base de datos se ha restaurado correctamente. Tus datos están listos.');
        } else {
            $errorDetails = empty($output) ? "Código {$returnVar}." : implode("\n", $output);
            return back()->with('error', 'Hubo un problema al importar la base de datos. Detalles: ' . $errorDetails);
        }
    }
}
