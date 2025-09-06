<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Product;

class Productseeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Using truncate for a clean slate. It's faster and resets the auto-incrementing ID.
        Product::truncate();

        Product::factory()->count(100)->create();
    }
}
