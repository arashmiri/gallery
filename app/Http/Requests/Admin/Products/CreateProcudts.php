<?php

namespace App\Http\Requests\Admin\Products;

use Illuminate\Foundation\Http\FormRequest;

class CreateProcudts extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'title' => 'required|unique:products,title',
            'category_id' => 'required|exists:categories,id',
            'price' => 'required|numeric',
            'thumbnail_url' => 'required|image|mimes:png,jpg,jpeg',
            'demo_url' => 'required|image|mimes:png,jpg,jpeg',
            'source_url' => 'required|image|mimes:png,jpg,jpeg',
            'description' => 'required',
        ];
    }
}
