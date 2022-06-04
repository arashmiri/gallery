<?php

namespace App\Utilities ;

use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class ImageUploader
{
    public static function upload($images)
    {
        foreach($images as $key => $value)
        {
               Storage::disk($value['storage'])->put($value['path'] , File::get($value['fileName']));
        }
    }
}