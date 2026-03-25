<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DeductionType extends Model
{
    use HasFactory, \App\Traits\Auditable;
    protected $fillable = ['name', 'abbreviation', 'is_active', 'sort_order'];
    public function levels() { return $this->belongsToMany(PayrollLevel::class, 'deduction_type_payroll_level'); }
}
