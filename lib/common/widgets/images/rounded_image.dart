import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ERoundedImage extends StatelessWidget {
  const ERoundedImage({
    super.key,
    this.border,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor = EColors.light,
    required this.imageURL,
    this.applyImageRadius = true,
    this.isNetworkImage = false,
    this.onPressed,
    this.fit = BoxFit.contain,
    this.borderRadius = ESizes.md,
    this.color,
  });
  final double? width, height;
  final String imageURL;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: border,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Center(
          child: Image(
            color: color,
            fit: fit,
            image: isNetworkImage
                ? NetworkImage(imageURL)
                : AssetImage(imageURL) as ImageProvider,
          ),
        ),
      ),
    );
  }
}