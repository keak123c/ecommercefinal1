import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/common/widgets/product_card/card_menu_icon.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return EAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome", style: Theme.of(context).textTheme.labelMedium!.apply(color: EColors.white)),
          Text("Siant Valentine", style: Theme.of(context).textTheme.headlineMedium!.apply(color: EColors.white))
        ],
      ),
      
      actions: const [
       CartMenuIcon(color: EColors.white),
      ],
      
    );
  }
}

