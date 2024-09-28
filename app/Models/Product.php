<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Product extends Model
{
    protected $fillable = ['name', 'section_id' , 'brand_id' ,'category_id' ,'subcategory_id'];

}
