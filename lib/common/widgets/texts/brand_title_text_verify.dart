import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EBrandTitleWithVerifyIcon extends StatelessWidget {
  const EBrandTitleWithVerifyIcon({
    super.key,
    this.color,
    this.iconColor = Colors.blue,
    this.maxlines = 1,
    required this.title,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSize.small,
    this.overflow = TextOverflow.ellipsis,
  });
  final Color? color, iconColor;
  final String title;
  final int maxlines;
  final TextAlign? textAlign;
  final TextSize brandTextSize;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            title,
            textAlign: textAlign,
            maxLines: maxlines,
            overflow: overflow,
            style: brandTextSize == TextSize.small 
                    ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
                    : brandTextSize == TextSize.medium
                      ? Theme.of(context).textTheme.labelLarge!.apply(color: color)
                      : Theme.of(context).textTheme.bodyMedium!.apply(color: color)
          
          ),
        ),
        const SizedBox(width: ESizes.xs),
        Icon(Iconsax.verify5, color: iconColor, size: ESizes.md),
      ],
    );
  }
}