@component('mail::message')
# Aprobación Definitiva de Planilla

Estimado Administrador/Contador,

Le notificamos formalmente que la planilla del personal de **{{ $planilla->level->name }}** correspondiente al mes de **{{ $planilla->period_name }}** ha sido APROBADA de manera definitiva.

- **Nivel Académico:** {{ $planilla->level->name }}
- **Total Neto a Dispersar:** L. {{ number_format($planilla->details->sum('net_salary'), 2) }}
- **Total Deducciones:** L. {{ number_format($planilla->details->sum('total_deductions'), 2) }}
- **Autorizada por:** {{ $planilla->approver->name ?? 'Autoridad del Liceo' }}

Puede proceder con la emisión del Consolidado Bancario a través del Centro de Reportes del sistema.

@component('mail::button', ['url' => url('/reportes')])
Ir al Centro de Reportes
@endcomponent

Gracias,<br>
Sistema de Planillas - {{ config('app.name') }}
@endcomponent
