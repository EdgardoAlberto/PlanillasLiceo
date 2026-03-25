<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Vouchers de Pago - {{ $planilla->period_name }}</title>
    <style>
        body { font-family: 'Arial', sans-serif; font-size: 12px; margin: 0; padding: 0; background: #fff; color: #000; }
        .voucher-container { width: 48%; float: left; box-sizing: border-box; padding-right: 20px; }
        .voucher-container.right { float: right; padding-right: 0; padding-left: 20px; }
        .row-clear { clear: both; margin-bottom: 60px; }
        .page-break { page-break-after: always; }
        .header-title { text-transform: uppercase; text-align: center; font-weight: bold; margin-bottom: 15px; font-size: 13px; font-family: 'Arial', sans-serif; }
        .info-line { display: flex; justify-content: space-between; margin-bottom: 8px; }
        .deduction-title { text-align: center; letter-spacing: 2px; margin: 15px 0 10px 0; text-decoration: underline; font-size: 11px; }
        .deduction-table { width: 100%; border-collapse: collapse; font-size: 11px; }
        .deduction-table td { padding: 2px 0; border: none; }
        .deduction-table td:nth-child(2) { text-align: center; width: 15px; }
        .deduction-table td:nth-child(3) { text-align: right; }
        .total-line td { border-top: 1px solid #000; border-bottom: 1px solid #000; padding: 4px 0; }
        .net-line { margin-top: 15px; display: flex; justify-content: space-between; }
        .signature-line { margin-top: 40px; margin-bottom: 20px;}
        @media print {
            @page { size: letter; margin: 15mm; }
            .d-print-none { display: none !important; }
            body { background: transparent; }
        }
        .btn-print { text-align: right; padding: 15px; background: #f8f9fa; border-bottom: 1px solid #ddd; margin-bottom: 20px; }
        .btn { padding: 8px 15px; background: #0d6efd; color: white; text-decoration: none; border-radius: 4px; font-family: sans-serif; cursor: pointer; border: none; font-weight: bold; }
        .btn-close { background: #6c757d; margin-left: 10px; }
    </style>
</head>
<body>
    <div class="d-print-none btn-print">
        <button onclick="window.print()" class="btn">Imprimir Vouchers</button>
        <button onclick="window.close()" class="btn btn-close">Cerrar</button>
    </div>

    <div style="padding: 0 15px;">
    @foreach($planilla->details->sortBy(function($d) { return $d->employee->first_name . ' ' . $d->employee->last_name; })->values() as $idx => $detail)
        @php
            $nombre = strtoupper($detail->employee->first_name . ' ' . $detail->employee->last_name);
            $salario = number_format($detail->base_salary, 2);
            $totalDed = number_format($detail->total_deductions, 2);
            $neto = number_format($detail->net_salary, 2);
        @endphp

        <div style="width: 100%;">
            <!-- COPIA 1 (Izquierda) -->
            <div class="voucher-container">
                <div class="header-title">
                    INSTITUTO SAGRADO CORAZON (L.H.)<br>
                    COMPROBANTE DE PAGO
                </div>
                
                <div style="margin-bottom: 8px;"><span>Periodo del mes de {{ ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'][$planilla->month - 1] }} de {{ $planilla->year }}</span></div>
                <div style="margin-bottom: 8px;"><span>NOMBRE: {{ $nombre }}</span></div>
                <div class="info-line"><span>Salario:</span> <span>{{ $salario }}</span></div>
                
                <div class="deduction-title">D E D U C C I O N E S</div>
                
                <table class="deduction-table">
                    @foreach($deductionsList as $dType)
                        @php
                            $dObj = $detail->deductions->firstWhere('deduction_type_id', $dType->id);
                            $amt = $dObj ? $dObj->amount : 0;
                        @endphp
                        <tr>
                            <td>{{ ltrim($dType->name) }}</td>
                            <td>:</td>
                            <td>{{ number_format($amt, 2) }}</td>
                        </tr>
                    @endforeach
                    <tr class="total-line">
                        <td>total deducciones:</td>
                        <td>:</td>
                        <td>{{ $totalDed }}</td>
                    </tr>
                </table>
                
                <div class="net-line">
                    <span>Neto a recibir:</span>
                    <span>{{ $neto }}</span>
                </div>
                
                <div class="signature-line">
                    Recibi: ____________________________________
                </div>
            </div>

            <!-- COPIA 2 (Derecha - Idéntica) -->
            <div class="voucher-container right">
                <div class="header-title">
                    INSTITUTO SAGRADO CORAZON (L.H.)<br>
                    COMPROBANTE DE PAGO
                </div>
                
                <div style="margin-bottom: 8px;"><span>Periodo del mes de {{ ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'][$planilla->month - 1] }} de {{ $planilla->year }}</span></div>
                <div style="margin-bottom: 8px;"><span>NOMBRE: {{ $nombre }}</span></div>
                <div class="info-line"><span>Salario:</span> <span>{{ $salario }}</span></div>
                
                <div class="deduction-title">D E D U C C I O N E S</div>
                
                <table class="deduction-table">
                    @foreach($deductionsList as $dType)
                        @php
                            $dObj = $detail->deductions->firstWhere('deduction_type_id', $dType->id);
                            $amt = $dObj ? $dObj->amount : 0;
                        @endphp
                        <tr>
                            <td>{{ ltrim($dType->name) }}</td>
                            <td>:</td>
                            <td>{{ number_format($amt, 2) }}</td>
                        </tr>
                    @endforeach
                    <tr class="total-line">
                        <td>total deducciones:</td>
                        <td>:</td>
                        <td>{{ $totalDed }}</td>
                    </tr>
                </table>
                
                <div class="net-line">
                    <span>Neto a recibir:</span>
                    <span>{{ $neto }}</span>
                </div>
                
                <div class="signature-line">
                    Recibi: ____________________________________
                </div>
            </div>
            
            <div class="row-clear"></div>
        </div>

        @if(($idx + 1) % 2 == 0 && !$loop->last)
            <div class="page-break"></div>
        @endif
    @endforeach
    </div>
</body>
</html>
