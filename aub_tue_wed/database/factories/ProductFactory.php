<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $category = $this->faker->randomElement(['sneaker', 'clothes']);

        if ($category === 'sneaker') {
            $title = $this->faker->randomElement([
                'Nike Air Force 1',
                'Adidas Stan Smith',
                'Converse Chuck Taylor',
                'Vans Old Skool',
                'New Balance 574',
                'Puma Suede Classic',
            ]);
        } else { // clothes
            $title = $this->faker->randomElement([
                'Nike Sportswear T-Shirt',
                'Adidas Originals Hoodie',
                'Levi\'s 501 Jeans',
                'The North Face Jacket',
                'Patagonia Fleece',
            ]);
        }

        return [
            'title' => $title . ' - ' . $this->faker->colorName(),
            'category' => $category,
            'qty' => $this->faker->numberBetween(0, 100),
            'price' => $this->faker->randomFloat(2, 49.99, 249.99),
            'instock' => $this->faker->boolean(90) ? 'available' : 'unavailable', // 90% chance of being available
            'purchased_at' => $this->faker->optional()->dateTimeThisYear(),
        ];
    }
}
