<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Models\Items;
use Illuminate\Http\Request;

class ItemApiController extends Controller
{
    public function index()
    {
        return Items::all();
    }

    public function store(Request $request)
    {
        $item = Items::create($request->all());
        return response()->json($item, 201);
    }

    public function show($id)
    {
        return Items::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $item = Items::findOrFail($id);
        $item->update($request->all());
        return response()->json($item, 200);
    }

    public function destroy($id)
    {
        Items::destroy($id);
        return response()->json(null, 204);
    }
}
