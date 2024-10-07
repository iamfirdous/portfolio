import 'package:flutter/material.dart';

class ScaleAnimate extends StatefulWidget {
  const ScaleAnimate({super.key, required this.child, this.scale = 1.15});

  final Widget child;
  final double scale;

  @override
  State<ScaleAnimate> createState() => _ScaleAnimateState();
}

class _ScaleAnimateState extends State<ScaleAnimate> with SingleTickerProviderStateMixin {
  late AnimationController scaleAnimationController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    scaleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    scaleAnimation = Tween(begin: 1.0, end: widget.scale).animate(
      CurvedAnimation(
        parent: scaleAnimationController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    scaleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => scaleAnimationController.forward(),
      onPointerUp: (_) => scaleAnimationController.reverse(),
      onPointerCancel: (_) => scaleAnimationController.reverse(),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => scaleAnimationController.forward(),
        onExit: (_) => scaleAnimationController.reverse(),
        child: ScaleTransition(
          scale: scaleAnimation,
          alignment: Alignment.center,
          filterQuality: FilterQuality.high,
          child: widget.child,
        ),
      ),
    );
  }
}