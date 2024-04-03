import 'package:flutter/material.dart';
import 'package:portfolio/util/constants.dart';
import 'package:portfolio/util/utils.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.text, required this.onTap});

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      child: Text(text, style: Styles.titleMedium),
    );
  }
}
