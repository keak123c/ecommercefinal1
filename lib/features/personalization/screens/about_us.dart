import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: dark ? EColors.dark : EColors.white, // You can customize the color
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to Saint Valentine!',
                style: Theme.of(context).textTheme.labelLarge!.apply(color: EColors.black),
              ),
              const SizedBox(height: 12),
              Text(
                'Saint Valentine is your go-to fashion destination, right at your fingertips.\n',
                style: Theme.of(context).textTheme.labelLarge!.apply(color: EColors.black),
              ),
              Text(
                'We believe style should be simple, accessible, and fun. That’s why we created StyleCart—an e-commerce app made for fashion lovers who want to discover, shop, and stay ahead of trends without the hassle.\n',
                style: Theme.of(context).textTheme.labelLarge!.apply(color: EColors.black),
              ),
              Text(
                'What We Offer:',
                style: Theme.of(context).textTheme.labelLarge!.apply(color: EColors.black)
              ),
              const SizedBox(height: 8),
              Text(
                '👗 Latest Styles: From everyday basics to standout pieces.\n'
                '🛍 Curated Collections: Clothes handpicked for every style.\n'
                '🚚 Fast Delivery: Your fashion, delivered quickly.\n'
                '💬 Easy Shopping Experience: Smooth browsing and friendly support.\n'
                '📱 Fashion On-the-Go: Shop anytime, anywhere.\n',
                style: Theme.of(context).textTheme.labelLarge!.apply(color: EColors.black),
              ),
              Text(
                'Saint Valentine isn’t just a store—it’s a growing community of people who love fashion, self-expression, and feeling great in what they wear.',
                style: Theme.of(context).textTheme.labelLarge!.apply(color: EColors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}