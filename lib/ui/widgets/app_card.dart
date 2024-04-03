import 'package:flutter/material.dart';
import 'package:portfolio/util/constants.dart';
import 'package:portfolio/util/utils.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.constraints,
    this.bgImage,
    required this.child,
  });

  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;
  final String? bgImage;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isMobile = Utils.isMobile(context);

    final padding = this.padding ?? EdgeInsets.symmetric(
      horizontal: isMobile ? 32.0 : 42.0,
      vertical: isMobile ? 24.0 : 32.0,
    );

    return Container(
      width: width,
      height: height,
      constraints: constraints,
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(32.0),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 4.0)],
        image: bgImage != null ? DecorationImage(image: AssetImage(bgImage!), fit: BoxFit.cover) : null,
      ),
      child: child,
    );
  }
}