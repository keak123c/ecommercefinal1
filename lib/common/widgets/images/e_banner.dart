import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';



class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
    this.width = 350,
    this.height = 200,
    required this.imageURL,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor = Colors.white,
    this.fit,
    this.padding,
    this.onPressed,
    this.isNetworkImage = false,
    this.borderRadius = ESizes.md,
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius ?  BorderRadius.circular(ESizes.md) : BorderRadius.zero,
          child: Image(fit: fit ,image: isNetworkImage ? NetworkImage(imageURL) : AssetImage(imageURL) as ImageProvider),
        ),
     ),
    );
  }
}