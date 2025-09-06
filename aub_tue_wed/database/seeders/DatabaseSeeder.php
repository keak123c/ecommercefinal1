<?php

namespace Database\Seeders;

use App\Models\Product;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();
        
        User::firstOrCreate(
            ['email' => 'test@example.com'], // Attributes to find by
            [                                 // Attributes to use if not found
                'name' => 'Test User',
                'password' => Hash::make('password'),
            ]
        );
        $this->call(Productseeder::class);
    }

}
