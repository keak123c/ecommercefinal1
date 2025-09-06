import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/shop/screens/order/order_list_item.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: EAppBar(
        title: Text("My Order"),
        showBackArrow: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(ESizes.defaultSpace),
        child: EOrderItemsList(),
      ),
    );
  }
}