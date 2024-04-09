import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SlideInGrid extends StatelessWidget {
  const SlideInGrid({super.key, required this.position, required this.child, this.duration = 600});

  final int position;
  final Widget child;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredGrid(
      columnCount: 2,
      position: position,
      duration: Duration(milliseconds: duration),
      child: SlideAnimation(
        curve: Curves.decelerate,
        verticalOffset: 150.0,
        child: FadeInAnimation(child: child),
      ),
    );
  }
}