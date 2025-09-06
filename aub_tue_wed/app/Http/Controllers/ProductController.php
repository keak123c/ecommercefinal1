<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product; // Make sure you have this model

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $query = Product::query();

        // Allow basic filtering by category
        if ($request->has('category')) {
            $query->where('category', $request->input('category'));
        }

        // Use pagination instead of all() for better performance
        return response()->json($query->paginate(15));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:1024',
            'category' => 'required|string|max:255',
            'qty' => 'required|integer',
            'price' => 'required|numeric',
            'instock' => 'required|boolean',
            'purchased_at' => 'nullable|date',
        ]);

        $product = Product::create($validated);

        return response()->json([
            'message' => 'Product created successfully',
            'data' => $product
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Product $product)
    {
        // With route-model binding, Laravel automatically finds the product or returns a 404.
        return response()->json($product);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Product $product)
    {
        $validated = $request->validate([
            'title' => 'sometimes|required|string|max:1024',
            'category' => 'sometimes|required|string|max:255',
            'qty' => 'sometimes|required|integer',
            'price' => 'sometimes|required|numeric',
            'instock' => 'sometimes|required|boolean',
            'purchased_at' => 'sometimes|nullable|date',
        ]);

        $product->update($validated);

        return response()->json([
            'message' => 'Product updated successfully',
            'data' => $product
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Product $product)
    {
        $product->delete();

        // Return a 204 No Content response, a standard for successful deletions.
        return response()->json(null, 204);
    }
}
