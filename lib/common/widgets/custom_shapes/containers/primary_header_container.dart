import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/common/widgets/custom_shapes/curved_edges/custom_curved_edges.dart';
import 'package:flutter/widgets.dart';


class EPrimaryHeaderContainer extends StatelessWidget {
  const EPrimaryHeaderContainer({
    super.key,
    required this.child,
    this.height,
  });
  final Widget child;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return ECurvedEdgesWidget(
      child: Container(
        color: EColors.black, 
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              child,
            ],
          ),
        
        )
      )
    );
  }
}