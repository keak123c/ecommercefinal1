import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ESpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: ESizes.appBarHeight,
    left: ESizes.defaultSpace,
    right: ESizes.defaultSpace,
    bottom: ESizes.defaultSpace,
  );
}