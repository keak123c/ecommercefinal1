<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Student;

class StudentApiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $students = Student::latest()->paginate(10);
        return $students;
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate(['name' => 'required|string']);
        $student = Student::create($validated);
        return response()->json($student, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $student = Student::find($id);
        if (!$student)
            return response()->json(["message" => "Not found"], 404);
        return $student;
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $validated = $request->validate([
            "name" => "required|string"
        ]);

        $student = Student::find($id);
        if (!$student)
            return response()->json(["message" => "Not found"], 404);
        $student->update($validated);
        return response()->json($student);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $student = Student::find($id);
        if (!$student)
        return response()->json(["message" => "Not found"], 404);
        $student->delete();
        return response()->json(["message" => "Deleted"]);
    }
}
