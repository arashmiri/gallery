<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Products\CreateProcudts;
use App\Http\Requests\Admin\Products\UpdateProductRequest;
use App\Models\Category;
use App\Models\Product;
use App\Models\User;
use App\Utilities\ImageUploader;

class ProductsController extends Controller
{
    public function all()
    {
        $products = Product::paginate(5);

        return view('admin.products.all', compact('products'));
    }

    public function create()
    {
        $categories = Category::all();

        return view('admin.products.create', compact('categories'));
    }

    public function add(CreateProcudts $request)
    {
        $validateData = $request->validated();

        $user = User::where('email', 'admin@gmail.com')->first();

        $CreatedProduct = Product::create(
            [
                'title' => $validateData['title'],
                'category_id' => $validateData['category_id'],
                'price' => $validateData['price'],
                'description' => $validateData['description'],
                'user_id' => $user->id,
            ]
        );

        $images = [
            'thumbnail_url' => [
                'storage' => 'public_storage',
                'fileName' => $validateData['demo_url'],
                'path' => 'products/'.$CreatedProduct->id.'/'.'thumbnail_url_'.$validateData['thumbnail_url']->getClientOriginalName(),
            ],
            'demo_url' => [
                'storage' => 'public_storage',
                'fileName' => $validateData['demo_url'],
                'path' => 'products/'.$CreatedProduct->id.'/'.'demo_url_'.$validateData['thumbnail_url']->getClientOriginalName(),
            ],
            'source_url' => [
                'storage' => 'local_storage',
                'fileName' => $validateData['source_url'],
                'path' => 'products/'.$CreatedProduct->id.'/'.'source_url_'.$validateData['thumbnail_url']->getClientOriginalName(),
            ],
        ];

        ImageUploader::upload($images);

        $CreatedProduct->update([
            'thumbnail_url' => 'products/'.$CreatedProduct->id.'/'.'thumbnail_url_'.$validateData['thumbnail_url']->getClientOriginalName(),
            'demo_url' => 'products/'.$CreatedProduct->id.'/'.'demo_url_'.$validateData['thumbnail_url']->getClientOriginalName(),
            'source_url' => 'products/'.$CreatedProduct->id.'/'.'source_url_'.$validateData['thumbnail_url']->getClientOriginalName(),
        ]);

        if ($CreatedProduct) {
            return back()->with('success', 'شد');
        } else {
            return back()->with('fail', 'نشد');
        }
    }

    public function delete($product_id)
    {
        $product = Product::findOrFail($product_id);

        $product->delete();

        if ($product) {
            return back()->with('success', 'محصول با موفقیت حذف شد');
        } else {
            return back()->with('fail', 'هنگام حذف محصول مشکلی پیش امد');
        }
    }

    public function downloadDemo($product_id)
    {
        $product = Product::findOrFail($product_id);

        return response()->download(public_path($product->demo_url));
    }

    public function downloadSource($product_id)
    {
        $product = Product::findOrFail($product_id);

        return response()->download(storage_path('app/local_storage/'.$product->source_url));
    }

    public function edit($product_id)
    {
        $product = Product::findOrFail($product_id);
        $categories = Category::all();

        return view('admin/products/edit', compact('product', 'categories'));
    }

    public function add2(CreateProcudts $request)
    {
        $validateData = $request->validated();

        $user = User::where('email', 'admin@gmail.com')->first();

        $images = [
            'thumbnail_url' => [
                'storage' => 'public_storage',
                'fileName' => $validateData['thumbnail_url'],
                'path' => 'products/'.$validateData['title'].'/'.'thumbnail_url_'.$validateData['thumbnail_url']->getClientOriginalName(),
            ],
            'demo_url' => [
                'storage' => 'public_storage',
                'fileName' => $validateData['demo_url'],
                'path' => 'products/'.$validateData['title'].'/'.'demo_url_'.$validateData['demo_url']->getClientOriginalName(),
            ],
            'source_url' => [
                'storage' => 'local_storage',
                'fileName' => $validateData['source_url'],
                'path' => 'products/'.$validateData['title'].'/'.'source_url_'.$validateData['source_url']->getClientOriginalName(),
            ],
        ];

        try {
            ImageUploader::upload($images);
        } catch (\Throwable $th) {
            throw $th;
        }

        $CreatedProduct = Product::create(
            [
                'title' => $validateData['title'],
                'category_id' => $validateData['category_id'],
                'price' => $validateData['price'],
                'description' => $validateData['description'],
                'user_id' => $user->id,
                'thumbnail_url' => 'products/'.$validateData['title'].'/'.'thumbnail_url_'.$validateData['thumbnail_url']->getClientOriginalName(),
                'demo_url' => 'products/'.$validateData['title'].'/'.'demo_url_'.$validateData['demo_url']->getClientOriginalName(),
                'source_url' => 'products/'.$validateData['title'].'/'.'source_url_'.$validateData['source_url']->getClientOriginalName(),
            ]
        );

        if ($CreatedProduct) {
            return back()->with('success', 'محصول با موفقیت اضافه شد');
        } else {
            return back()->with('fail', 'هنگام اضافه کردن محصول مشکلی پیش امد');
        }
    }

    public function update(UpdateProductRequest $request, $product_id)
    {
        $validateData = $request->validated();

        $images = [];

        $product = Product::find($product_id);

        if (isset($validateData['thumbnail_url'])) {
            $images +=
            [
                'thumbnail_url' => [
                    'storage' => 'public_storage',
                    'fileName' => $validateData['thumbnail_url'],
                    'path' => 'products/'.$validateData['title'].'/'.'thumbnail_url_'.$validateData['thumbnail_url']->getClientOriginalName(),

                ],
            ];

            $product->update(
                [
                    'thumbnail_url' => 'products/'.$validateData['title'].'/'.'thumbnail_url_'.$validateData['thumbnail_url']->getClientOriginalName(),
                ]
            );
        }

        if (isset($validateData['demo_url'])) {
            $images +=
            [
                'demo_url' => [
                    'storage' => 'public_storage',
                    'fileName' => $validateData['demo_url'],
                    'path' => 'products/'.$validateData['title'].'/'.'demo_url_'.$validateData['demo_url']->getClientOriginalName(),
                ],
            ];

            $product->update(
                [
                    'demo_url' => 'products/'.$validateData['title'].'/'.'demo_url_'.$validateData['demo_url']->getClientOriginalName(),
                ]
            );
        }

        // && $validateData['source_url'] != $product->source_url

        if (isset($validateData['source_url']) && $validateData['source_url'] != $product->source_url) {
            $images +=
            [
                'source_url' => [
                    'storage' => 'local_storage',
                    'fileName' => $validateData['source_url'],
                    'path' => 'products/'.$validateData['title'].'/'.'source_url_'.$validateData['source_url']->getClientOriginalName(),
                ],
            ];

            $product->update(
                [
                    'source_url' => 'products/'.$validateData['title'].'/'.'source_url_'.$validateData['source_url']->getClientOriginalName(),
                ]
            );
        }

        try {
            ImageUploader::upload($images);
        } catch (\Throwable $th) {
            throw $th;
        }

        $product->update(
            [
                'title' => $validateData['title'],
                'category_id' => $validateData['category_id'],
                'price' => $validateData['price'],
                'description' => $validateData['description'],
            ]
        );

        if ($product) {
            return back()->with('success', 'محصول با موفقیت ویرایش شد');
        } else {
            return back()->with('fail', 'هنگام ویرایش محصول خطایی رخ داده است');
        }
    }
}
