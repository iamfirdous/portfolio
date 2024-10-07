import 'package:flutter/material.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:portfolio/ui/widgets/scale_animate.dart';

class SimpleTilt extends StatelessWidget {
  const SimpleTilt({
    super.key,
    this.shadow = false,
    this.scale = false,
    this.radius = 4.0,
    required this.child,
  });

  final bool shadow;
  final bool scale;
  final Widget child;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final widget = Tilt(
      tiltConfig: const TiltConfig(angle: 12.0, enableGestureSensors: false),
      shadowConfig: ShadowConfig(disable: !shadow),
      borderRadius: BorderRadius.circular(radius),
      child: child,
    );

    return scale ? ScaleAnimate(child: widget) : widget;
  }
}