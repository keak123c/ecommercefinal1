<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    //** @use HasFactory<\Database\Factories\StudentFactory>;
    use HasFactory;
public $table = 'tbl_student';
public $primaryKey = 'sid';
protected $fillable = ['name'];
public $timestamps = true;

protected function serializeDate(\DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }

}
