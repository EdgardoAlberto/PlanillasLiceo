<?php

namespace Database\Seeders;

use App\Models\AuditLog;
use App\Models\DeductionType;
use App\Models\PayrollLevel;
use App\Models\Role;
use App\Models\Setting;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // 1. Roles
        $adminRole = Role::create(['name' => 'Administrador']);
        $contaRole = Role::create(['name' => 'Contadora']);
        $religRole = Role::create(['name' => 'Religiosa']);

        // 2. Default User
        User::create([
            'name' => 'Administrador',
            'email' => 'admin@liceo.test', // Login as admin
            'password' => Hash::make('Octubre3'),
            'role_id' => $adminRole->id,
        ]);

        // 3. Payroll Levels
        $levels = [
            'ADMINISTRACION Y APOYO',
            'PRE-BASICA',
            'BÁSICA',
            'SECUNDARIA',
            'Otro Personal'
        ];
        
        $levelModels = [];
        foreach ($levels as $l) {
            $levelModels[] = PayrollLevel::create(['name' => $l]);
        }

        // 4. Deduction Types
        $deductions = [
            ['name' => 'Instituto Hondureño de Seguridad Social', 'abbreviation' => 'IHS'],
            ['name' => 'Régimen de Aportaciones Privadas', 'abbreviation' => 'RAP'],
            ['name' => 'Impuesto Vecinal', 'abbreviation' => 'IMP'],
            ['name' => 'Anticipos', 'abbreviation' => 'ANT'],
            ['name' => 'Colegio de Profesores', 'abbreviation' => 'COL'],
            ['name' => 'Cooperativa', 'abbreviation' => 'COO'],
            ['name' => 'Deducción Varios', 'abbreviation' => 'VAR'],
        ];

        $dedModels = [];
        foreach ($deductions as $d) {
            $dedModels[] = DeductionType::create($d);
        }

        // 5. Attach Deductions to Levels
        // Example: All levels except "Otro Personal" get standard deductions.
        foreach ($levelModels as $level) {
            if ($level->name !== 'Otro Personal') {
                $level->deductionTypes()->attach(collect($dedModels)->pluck('id'));
            } else {
                // Otro personal might only have "Var" or "Anticipos"
                $level->deductionTypes()->attach([
                    $dedModels[3]->id, // ANT
                    $dedModels[6]->id  // VAR
                ]);
            }
        }

        // 6. Settings Base
        Setting::create(['key' => 'institution_name', 'value' => 'Instituto Sagrado Corazón (Liceo Hondureño)']);
        Setting::create(['key' => 'signature_religious', 'value' => 'Sor Directora']);
        Setting::create(['key' => 'signature_accountant', 'value' => 'Lic. Contadora']);
        
    }
}
