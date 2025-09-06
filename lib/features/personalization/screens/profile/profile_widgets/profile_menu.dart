import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key, required this.title, required this.value, this.icon  = Iconsax.arrow_right_34, this.onPressed});
  final String title;
  final String value;
  final IconData? icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: ESizes.spaceBtwItems),
        child: Row(
          children: [
            Expanded(flex: 3, child: Text(title, style : Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis,)),
            Expanded(flex: 5, child: Text(value, style : Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis,),),
            Expanded(child: Icon(icon, color: Colors.black, size: 18,)),
          ],
        ),
        ),
    );
  }
}