import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/common/widgets/texts/brand_title_text_verify.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/image_string.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';

class EBrandCard extends StatelessWidget {
  const EBrandCard({
    super.key,
    this.onTap,
    required this.showBorder,
    required this.title,
    required this.productStocks,
  });

  
  final VoidCallback? onTap;
  final bool showBorder;
  final String title, productStocks;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return GestureDetector(
        onTap: onTap,
        child: ERoundedContainer(
          padding: const EdgeInsets.all(ESizes.sm),
          showBorder: showBorder,
          backgroundColor: Colors.transparent,
          child: Row(
            children: [
              //---icon---
              Flexible(
                //flex: 1,
                child: ERoundedImage(
                    imageURL: EImage.nikeLogo,
                    width: 50, height: 50, 
                    fit: BoxFit.cover,
                    backgroundColor: Colors.transparent,
                    color: dark ? EColors.white : EColors.black,
                    padding: EdgeInsets.zero,
                    //border: Border.all(color:EColors.black),          
                  ),
              ),
              const SizedBox(width: ESizes.xs),                               
              Expanded(
                //flex: 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,                        
                      children: [
                      EBrandTitleWithVerifyIcon(title: title, brandTextSize: TextSize.large, overflow: TextOverflow.ellipsis),
                      Text(productStocks, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.left),
                    ],
                  ),
              ),                                                        
            ],
          ),
        ),
      );
  }
}