import 'package:flutter/material.dart';
import 'package:wink/core/common/widgets/curverd_edges/curverd_edges.dart';

class CurvedWidget extends StatelessWidget {
  const CurvedWidget({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: CurvedEdges(), child: child);
  }
}
