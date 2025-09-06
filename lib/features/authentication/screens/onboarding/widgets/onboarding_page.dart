import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';



class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image1,
    required this.title,
    required this.subTitle,
  });

  final String image1, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image1),
              fit: BoxFit.cover,
            ),
          ),
        ),
         Padding(
           padding: const EdgeInsets.only(
            left: ESizes.defaultSpace,
            right: ESizes.defaultSpace,
            bottom: 120,
           ),
           child: Align(
            alignment: Alignment.bottomCenter,
             child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: EColors.textSecondary),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      subTitle,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: EColors.textSecondary),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
           ),
         ),
      ],
    );
  }
}