<?php
namespace App\Traits;

use App\Models\AuditLog;
use Illuminate\Support\Facades\Auth;

trait Auditable
{
    public static function bootAuditable()
    {
        static::created(function ($model) {
            self::logAudit('created', $model);
        });

        static::updated(function ($model) {
            self::logAudit('updated', $model);
        });

        static::deleted(function ($model) {
            self::logAudit('deleted', $model);
        });
    }

    protected static function logAudit($action, $model)
    {
        if (Auth::check()) {
            AuditLog::create([
                'user_id' => Auth::id(),
                'action' => $action,
                'table_name' => $model->getTable(),
                'record_id' => $model->id ?? null,
                'old_values' => $action === 'updated' ? $model->getOriginal() : null,
                'new_values' => $action !== 'deleted' ? $model->getAttributes() : null,
            ]);
        }
    }
}
