<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Page extends Model
{
    use HasFactory;
    protected $fillable = [
        'page',
        'icon',
        'path',
        'order',
        'page_id',
    ];

    public function permissions()
    {
        return $this->hasMany(Permission::class,'page_id', 'id');
    }
    public function pages()
    {
        return $this->hasMany(Page::class,'page_id', 'id');
    }

    public function page_name()
    {
        return $this->belongsTo(Page::class, 'page_id', 'id');
    }

}
