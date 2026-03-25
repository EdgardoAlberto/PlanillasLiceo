<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PayrollLevel extends Model
{
    use HasFactory, \App\Traits\Auditable;
    protected $fillable = ['name'];
    public function employees() { return $this->hasMany(Employee::class); }
    public function payrolls() { return $this->hasMany(Payroll::class); }
    public function deductionTypes() { return $this->belongsToMany(DeductionType::class, 'deduction_type_payroll_level'); }
}
