<?php
namespace App\Mail;

use App\Models\Payroll;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class PayrollApprovedMail extends Mailable
{
    use Queueable, SerializesModels;
    
    public $planilla;

    public function __construct(Payroll $planilla)
    {
        $this->planilla = $planilla;
    }

    public function build()
    {
        return $this->subject('Autorización de Planilla: ' . $this->planilla->level->name)
                    ->markdown('emails.payroll_approved');
    }
}
