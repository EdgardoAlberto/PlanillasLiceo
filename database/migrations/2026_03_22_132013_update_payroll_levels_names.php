<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        \Illuminate\Support\Facades\DB::table('payroll_levels')
            ->where('name', 'Administración')
            ->orWhere('name', 'Administracion')
            ->update(['name' => 'ADMINISTRACION Y APOYO']);
            
        \Illuminate\Support\Facades\DB::table('payroll_levels')->where('name', 'Preescolar')->update(['name' => 'PRE-BASICA']);
        \Illuminate\Support\Facades\DB::table('payroll_levels')->where('name', 'Primaria')->update(['name' => 'BÁSICA']);
        \Illuminate\Support\Facades\DB::table('payroll_levels')->where('name', 'Secundaria')->update(['name' => 'SECUNDARIA']);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        \Illuminate\Support\Facades\DB::table('payroll_levels')->where('name', 'ADMINISTRACION Y APOYO')->update(['name' => 'Administración']);
        \Illuminate\Support\Facades\DB::table('payroll_levels')->where('name', 'PRE-BASICA')->update(['name' => 'Preescolar']);
        \Illuminate\Support\Facades\DB::table('payroll_levels')->where('name', 'BÁSICA')->update(['name' => 'Primaria']);
        \Illuminate\Support\Facades\DB::table('payroll_levels')->where('name', 'SECUNDARIA')->update(['name' => 'Secundaria']);
    }
};
