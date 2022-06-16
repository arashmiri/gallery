<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductsController extends Controller
{

    public function index(Request $request)
    {
        $products = null;

        if(isset($request->filter, $request->action))
        {
            $products = $this->findFilter($request?->filter, $request?->action) ?? Product::all();
        }
        else if($request->has('search'))
        {
            $products = Product::where('title', 'LIKE' ,'%'.$request->input('search') . '%')->get();
        }
        else{
            $products = Product::all();
        }  

        $categories = Category::all();

        return view('frontend.products.all' , compact('products' , 'categories'));
    }

    public function show($product_id)
    {
        $product = Product::find($product_id);

        $simillarProducts = Product::where('category_id' , $product->category_id)->take(4)->get();

        //find product category and get category
        $category = Category::find($product->category_id);

        return view('frontend.products.single' , compact('product' , 'simillarProducts' , 'category'));
    }

    private function findFilter(string $className, string $methodName)
    {
        $baseNamespace = "App\Http\Controllers\Filters\\";

        $className = $baseNamespace . ($className . 'Filter');

        if(!class_exists($className))
        {
            return null;
        }

        $object = new $className;

        if(!method_exists($object, $methodName))
        {
            return null;
        }

        return $object->{$methodName}();
    }
}
