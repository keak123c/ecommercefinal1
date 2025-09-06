import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EAppBar extends StatelessWidget implements PreferredSizeWidget{
  const EAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
    this.titleTextStyle,
    this.backgroundColor
    });

    final Widget? title;
    final List<Widget>? actions;
    final IconData? leadingIcon;
    final VoidCallback? leadingOnPressed;
    final bool showBackArrow ;
    final TextStyle? titleTextStyle;
    final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ESizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow ? IconButton(onPressed: () => Get.back(),icon: const Icon(Icons.arrow_back_ios_rounded)) 
        : leadingIcon != null ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)) : null,
        title: title,
        titleTextStyle: titleTextStyle,
        actions: actions,
        backgroundColor: backgroundColor,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(EDeviceUtils.getAppBarHeight());
}