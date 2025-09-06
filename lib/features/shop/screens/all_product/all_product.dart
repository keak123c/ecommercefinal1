import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/sortable/sortable.dart';
import 'package:flutter/material.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppBar(title: Text(title), titleTextStyle: Theme.of(context).textTheme.headlineSmall, showBackArrow: true),
      body: const SingleChildScrollView(
        child: ESortableProducts(),
        )
      );
  }
}

