<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('employees', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->date(column: 'dob') -> nullable();
            $table->enum(column: 'gender', allowed: ['M', 'F', 'O']) -> nullable();
            $table->text(column: 'address') -> nullable();
            $table->string(column: 'tel') -> nullable();
            $table->string(column: 'email') -> nullable();
            $table->string(column: 'position') -> nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employees');
    }
};
