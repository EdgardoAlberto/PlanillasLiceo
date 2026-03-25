@extends('layouts.admin')
@section('title', 'Planillas')

@section('content')
<div class="d-flex justify-content-between align-items-center mb-4">
    <h2 class="h4 text-secondary mb-0"><i class="fa fa-file-invoice-dollar text-theme me-2"></i>Gestión de Planillas</h2>
    @if(in_array(auth()->user()->role->name, ['Administrador', 'Contadora']))
    <a href="{{ url('/planillas/create') }}" class="btn btn-theme"><i class="fa fa-plus me-1"></i> Generar Planilla</a>
    @endif
</div>

<div class="card table-theme">
    <div class="card-body p-0">
        <div class="table-responsive">
            <table class="table table-hover mb-0 align-middle">
                <thead class="table-light">
                    <tr>
                        <th>Período</th>
                        <th>Nivel de Personal</th>
                        <th>Estado</th>
                        <th>Creada Por</th>
                        <th class="text-end">Total Neto a Pagar</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($planillas as $p)
                    <tr>
                        <td><strong>{{ $p->period_name }}</strong></td>
                        <td>{{ $p->level->name }}</td>
                        <td>
                            @if($p->status == 'Borrador') <span class="badge bg-secondary">Borrador</span>
                            @elseif($p->status == 'Revisada') <span class="badge bg-info text-dark">Revisada</span>
                            @elseif($p->status == 'Aprobada') <span class="badge bg-success">Aprobada</span>
                            @else <span class="badge bg-primary">{{ $p->status }}</span> @endif
                        </td>
                        <td>{{ $p->creator->name ?? 'N/A' }}</td>
                        <td class="text-end fw-bold text-success">L. {{ number_format($p->details->sum('net_salary'), 2) }}</td>
                        <td class="text-center">
                            <a href="{{ url('/planillas/'.$p->id) }}" class="btn btn-sm btn-outline-primary" title="Ver Detalle"><i class="fa fa-eye"></i> Detalles</a>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="6" class="text-center text-muted py-4">No hay planillas generadas.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
