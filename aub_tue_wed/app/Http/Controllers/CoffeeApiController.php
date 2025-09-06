<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Coffee;

class CoffeeApiController extends Controller
{
    public function index()
    {
        $coffees = Coffee::all();
        return response()->json($coffees);
    }

    /**
     * Store a newly created coffee.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name'  => 'required|string|max:255',
            'type'  => 'required|string|max:100',
            'price' => 'required|numeric',
        ]);

        $coffee = Coffee::create($validated);

        return response()->json([
            'message' => 'Coffee created successfully',
            'data'    => $coffee
        ], 201);
    }

    /**
     * Display the specified coffee.
     */
    public function show($id)
    {
        $coffee = Coffee::find($id);

        if (!$coffee) {
            return response()->json(['message' => 'Coffee not found'], 404);
        }

        return response()->json($coffee);
    }

    /**
     * Update the specified coffee.
     */
    public function update(Request $request, $id)
    {
        $coffee = Coffee::find($id);

        if (!$coffee) {
            return response()->json(['message' => 'Coffee not found'], 404);
        }

        $validated = $request->validate([
            'name'  => 'sometimes|string|max:255',
            'type'  => 'sometimes|string|max:100',
            'price' => 'sometimes|numeric',
        ]);

        $coffee->update($validated);

        return response()->json([
            'message' => 'Coffee updated successfully',
            'data'    => $coffee
        ]);
    }

    /**
     * Remove the specified coffee.
     */
    public function destroy($id)
    {
        $coffee = Coffee::find($id);

        if (!$coffee) {
            return response()->json(['message' => 'Coffee not found'], 404);
        }

        $coffee->delete();

        return response()->json(['message' => 'Coffee deleted successfully']);
    }
}
