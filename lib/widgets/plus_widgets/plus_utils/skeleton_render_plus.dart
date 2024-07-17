import 'package:flutter/material.dart';

import 'skeleton_plus.dart';

class SkeletonRenderPlus extends StatefulWidget {
  final SkeletonPlus skeletonPlus;
  SkeletonRenderPlus({required this.skeletonPlus});

  @override
  _SkeletonRenderPlusState createState() => _SkeletonRenderPlusState();
}

class _SkeletonRenderPlusState extends State<SkeletonRenderPlus>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _gradientPosition;
  double get _gradientPositionValue {
    if (_gradientPosition != null && _gradientPosition.value is double) {
      return _gradientPosition.value as double;
    } else {
      return 0;
    }
  }

  @override
  void initState() {
    _controller = AnimationController(
      duration: widget.skeletonPlus.duration ?? Duration(milliseconds: 1500),
      vsync: this,
    );
    _gradientPosition = Tween<double>(
      begin: -30,
      end: 10,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    )..addListener(
        () {
          setState(() {});
        },
      );

    _controller.repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(_gradientPositionValue, 0),
          end: Alignment(2, 0),
          colors: [
            widget.skeletonPlus.baseColor ?? const Color(0xFFE0E0E0),
            widget.skeletonPlus.highlightColor ?? const Color(0xFFF0F1F1),
            widget.skeletonPlus.baseColor ?? const Color(0xFFE0E0E0),
          ],
          stops: [
            0.2,
            0.6,
            0.9,
          ],
        ),
      ),
    );
  }
}
