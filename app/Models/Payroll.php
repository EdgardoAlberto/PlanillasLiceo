<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Payroll extends Model
{
    use HasFactory, \App\Traits\Auditable;
    protected $fillable = ['month', 'year', 'level_id', 'status', 'created_by', 'reviewed_by', 'approved_by', 'observations'];
    public function level() { return $this->belongsTo(PayrollLevel::class); }
    public function details() { return $this->hasMany(PayrollDetail::class); }
    public function creator() { return $this->belongsTo(User::class, 'created_by'); }
    public function reviewer() { return $this->belongsTo(User::class, 'reviewed_by'); }
    public function approver() { return $this->belongsTo(User::class, 'approved_by'); }

    public function getPeriodNameAttribute()
    {
        $meses = [
            1 => 'Ene', 2 => 'Feb', 3 => 'Mar', 4 => 'Abr', 5 => 'May', 6 => 'Jun',
            7 => 'Jul', 8 => 'Ago', 9 => 'Sep', 10 => 'Oct', 11 => 'Nov', 12 => 'Dic'
        ];
        return ($meses[$this->month] ?? '') . '/' . $this->year;
    }
}
