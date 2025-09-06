

import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';

class ETabBar extends StatelessWidget implements PreferredSizeWidget{
  const ETabBar({super.key, required this.tabs});
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? EColors.dark : EColors.white,
      child: TabBar(
        tabs: tabs,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        indicatorColor: dark ? EColors.white : EColors.black,
        labelColor: dark ? EColors.white : EColors.black,
        unselectedLabelColor: EColors.grey,
        ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(EDeviceUtils.getAppBarHeight()); 
}

