<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
    use HasFactory;

     protected $fillable = [
        'read',
        'edit',
        'create',
        'update',
        'delete',
        'page_id',
        'role_id',
    ];

    public function page()
    {
        return $this->belongsTo(Page::class);
    }

    public function role()
    {
        return $this->belongsTo(Role::class);
    }
}
