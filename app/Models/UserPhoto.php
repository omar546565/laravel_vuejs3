<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserPhoto extends Model
{
    use HasFactory;
    protected $table = 'user_photos';

    protected $fillable = [
        'name',
        'user_id',
    ];

    public $timestamps = false;


    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
