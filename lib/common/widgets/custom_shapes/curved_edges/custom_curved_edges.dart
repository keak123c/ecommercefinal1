import 'package:e_commerce/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:flutter/material.dart';



class ECurvedEdgesWidget extends StatelessWidget {
  const ECurvedEdgesWidget({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: EcustomCurvedEdges(),
      child: child,
    );
  }
}