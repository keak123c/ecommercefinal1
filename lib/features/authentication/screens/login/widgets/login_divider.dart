import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class Devider extends StatelessWidget {
  const Devider({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ?  EColors.grey : EColors.darkGrey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text("Or Sign in with", style: Theme.of(context).textTheme.labelMedium),
        Flexible(
          child: Divider(
            color: dark ?  EColors.grey : EColors.darkGrey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
    
  }
}

