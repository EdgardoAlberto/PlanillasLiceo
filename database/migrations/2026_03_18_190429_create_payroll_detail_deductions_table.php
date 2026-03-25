<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('payroll_detail_deductions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('payroll_detail_id')->constrained('payroll_details')->onDelete('cascade');
            $table->foreignId('deduction_type_id')->constrained('deduction_types')->onDelete('cascade');
            $table->decimal('amount', 10, 2);
            $table->timestamps();
        });
    }
    public function down(): void { Schema::dropIfExists('payroll_detail_deductions'); }
};
