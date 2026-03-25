<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PayrollDetailDeduction extends Model
{
    use HasFactory;
    protected $fillable = ['payroll_detail_id', 'deduction_type_id', 'amount'];
    public function payrollDetail() { return $this->belongsTo(PayrollDetail::class); }
    public function deductionType() { return $this->belongsTo(DeductionType::class); }
}
