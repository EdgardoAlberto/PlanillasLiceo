<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('payrolls', function (Blueprint $table) {
            $table->id();
            $table->integer('month');
            $table->integer('year');
            $table->foreignId('level_id')->constrained('payroll_levels')->onDelete('cascade');
            $table->enum('status', ['Borrador', 'Revisada', 'Aprobada', 'Enviada'])->default('Borrador');
            $table->foreignId('created_by')->nullable()->constrained('users')->onDelete('set null');
            $table->foreignId('reviewed_by')->nullable()->constrained('users')->onDelete('set null');
            $table->foreignId('approved_by')->nullable()->constrained('users')->onDelete('set null');
            $table->text('observations')->nullable();
            $table->timestamps();
            $table->unique(['month', 'year', 'level_id']);
        });
    }
    public function down(): void { Schema::dropIfExists('payrolls'); }
};
