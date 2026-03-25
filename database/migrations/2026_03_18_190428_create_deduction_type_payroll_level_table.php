<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('deduction_type_payroll_level', function (Blueprint $table) {
            $table->id();
            $table->foreignId('deduction_type_id')->constrained('deduction_types')->onDelete('cascade');
            $table->foreignId('payroll_level_id')->constrained('payroll_levels')->onDelete('cascade');
            $table->timestamps();
        });
    }
    public function down(): void { Schema::dropIfExists('deduction_type_payroll_level'); }
};
