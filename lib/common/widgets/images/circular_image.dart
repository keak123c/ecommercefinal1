import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key, 
    this.fit = BoxFit.cover, 
    required this.image, 
    this.width, 
    this.height, 
    this.padding = ESizes.sm, 
    this.background, 
    this.overlayColor, 
    this.isNetworkImage = false,    
  });
  final BoxFit? fit;
  final String image;
  final double? width;
  final double? height;
  final double padding;
  final Color? background;
  final Color? overlayColor;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        //if image background color is null then switc it to light and dark mode
        color: background ?? (EHelperFunctions.isDarkMode(context) ? EColors.black : EColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Image(
          image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider, 
          fit: fit, 
          color: overlayColor),
      ),
    );
  }
}