import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class SettingListTile extends StatelessWidget {
  const SettingListTile({super.key, required this.icon, required this.title, required this.subtitle, this.trailing, this.onPressed});
  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        leading: Icon(icon, size: 28, color: EHelperFunctions.isDarkMode(context) ? EColors.white : EColors.black),
        title: Text(title, style: Theme.of(context).textTheme.titleLarge),
        subtitle: Text(subtitle, style: Theme.of(context).textTheme.labelSmall),
        trailing: trailing,
        onTap: onPressed,
    );
  }
}