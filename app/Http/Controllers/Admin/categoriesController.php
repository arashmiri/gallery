<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Categories\CreateCategory;
use App\Models\Category;
use Illuminate\Http\Request;

class categoriesController extends Controller
{
    public function index()
    {
        $categories = Category::paginate(3);

        return view('admin.categories.index', compact('categories'));
    }

    public function create()
    {
        return view('admin.categories.create');
    }

    public function store(CreateCategory $request)
    {
        $validationData = $request->validated();

        $category = Category::create([
            'title' => $validationData['title'],
            'slug' => $validationData['slug'],
        ]);

        if (! $category) {
            return back()->with('fail', 'هنگام ایجاد دسته بندی مشکلی پیش امده است');
        }

        return back()->with('success', 'دسته بندی با موفقیت ایجاد شد');
    }

    public function all()
    {
        $categories = Category::paginate(3);

        return view('admin.categories.show', compact('categories'));
    }

    public function delete($category_id)
    {
        $category = Category::find($category_id);

        if ($category->delete()) {
            return back()->with('success', 'دسته بندی با موفقیت حذف شد');
        } else {
            return back()->with('fail', 'هنگام حذف دسته بندی مشکلی پیش امده است');
        }
    }

    public function edit($category_id)
    {
        $category = Category::find($category_id);

        return view('admin.categories.edit', compact('category'));
    }

    public function update(Request $request, $category_id)
    {
        $category = Category::find($category_id);

        $updatedCategory = $category->update([
            'title' => $request['title'],
            'slug' => $request['slug'],
        ]);

        if ($updatedCategory) {
            return back()->with('success', 'دسته بندی به موفقیت ویرایش شد');
        } else {
            return back()->with('fail', 'هنگام ویرایش دسته بندی مشکلی پیش امده است');
        }
    }
}
