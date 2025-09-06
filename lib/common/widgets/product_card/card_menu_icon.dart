import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CartMenuIcon extends StatelessWidget {  
  const CartMenuIcon({
    super.key,
    this.onPressed,
    this.color,
  });
  final VoidCallback? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    //final dark = EHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(onPressed: onPressed, icon: Icon(Iconsax.shopping_bag, color: color)),
        Positioned( 
        right: 0, 
        child: Container(
          width: 18, 
          height: 18, 
          decoration: const BoxDecoration(
            color: EColors.darkGrey, 
            shape: BoxShape.circle
          ), 
          child: Center(child: Text("1", style: Theme.of(context).textTheme.labelSmall!.apply(color: EColors.white))),
        ))
      ],
    );
  }
}