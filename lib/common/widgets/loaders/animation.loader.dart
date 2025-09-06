import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';	

class EAnimationLoaderWidgets extends StatelessWidget {
  // Default constructor for the EAnimationLoaderWidgets
  //
  //
  //Parameters:
  // -Text: The text to be display below the animation
  // -animation: The path to the lottie animation file
  // -showAction: Whether to show the action button below the animation
  // -actionText: The text to be display on the action button
  // -onActionPressed: Callback function to be called when the action button is pressed
  const EAnimationLoaderWidgets({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });
    final String text;
    final String animation;
    final bool showAction;
    final String? actionText;
    final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8), // Load the animation
          const SizedBox(height: ESizes.defaultSpace),
          Text(text, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
          const SizedBox(height: ESizes.defaultSpace),
          showAction 
            ? SizedBox(
              width: 250,
              child: OutlinedButton(
                onPressed: onActionPressed,
                style: OutlinedButton.styleFrom(
                  backgroundColor: EColors.dark,
                ),
                child: Text(actionText!, style: Theme.of(context).textTheme.bodyMedium!.apply(color: EColors.light)),
              )
                
              )
            : const SizedBox(),
        ]
      )
    );
  }
}