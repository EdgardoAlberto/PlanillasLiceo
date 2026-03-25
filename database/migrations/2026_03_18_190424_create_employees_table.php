<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('employees', function (Blueprint $table) {
            $table->id();
            $table->string('employee_code')->unique();
            $table->string('dni')->unique();
            $table->string('first_name');
            $table->string('last_name');
            $table->string('ihss_number')->nullable();
            $table->string('bank_name')->nullable();
            $table->string('bank_account')->nullable();
            $table->string('email')->nullable();
            $table->foreignId('level_id')->constrained('payroll_levels')->onDelete('cascade');
            $table->decimal('base_salary', 10, 2);
            $table->string('phone')->nullable();
            $table->enum('status', ['Activo', 'Inactivo'])->default('Activo');
            $table->date('hire_date')->nullable();
            $table->timestamps();
        });
    }
    public function down(): void { Schema::dropIfExists('employees'); }
};
