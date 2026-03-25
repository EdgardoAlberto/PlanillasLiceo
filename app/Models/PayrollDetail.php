<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PayrollDetail extends Model
{
    use HasFactory, \App\Traits\Auditable;
    protected $fillable = ['payroll_id', 'employee_id', 'base_salary', 'total_deductions', 'net_salary'];
    public function payroll() { return $this->belongsTo(Payroll::class); }
    public function employee() { return $this->belongsTo(Employee::class); }
    public function deductions() { return $this->hasMany(PayrollDetailDeduction::class); }
}
