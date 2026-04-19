<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    use HasFactory, \App\Traits\Auditable;
    protected $fillable = ['employee_code', 'dni', 'first_name', 'last_name', 'ihss_number', 'bank_name', 'bank_account', 'email', 'level_id', 'base_salary', 'phone', 'status', 'hire_date', 'support_category'];
    public function level() { return $this->belongsTo(PayrollLevel::class); }
    public function payrollDetails() { return $this->hasMany(PayrollDetail::class); }
}
