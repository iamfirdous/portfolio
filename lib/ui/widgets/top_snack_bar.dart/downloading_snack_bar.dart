import 'package:flutter/material.dart';
import 'package:portfolio/util/constants.dart';
import 'package:portfolio/util/utils.dart';

class DownloadingSnackBar extends StatefulWidget {
  const DownloadingSnackBar.build({
    super.key,
    required this.message,
    this.icon = const Icon(
      Icons.downloading,
      color: AppColors.grey,
      size: 46.0,
    ),
    this.textStyle = Styles.titleMedium,
    this.maxLines = 2,
    this.backgroundColor = const Color(0xB3524FE0),
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textAlign = TextAlign.center,
  });

  final String message;
  final Widget icon;
  final Color backgroundColor;
  final TextStyle textStyle;
  final int maxLines;
  final List<BoxShadow> boxShadow;
  final BorderRadius borderRadius;
  final TextAlign textAlign;

  @override
  DownloadingSnackBarState createState() => DownloadingSnackBarState();
}

class DownloadingSnackBarState extends State<DownloadingSnackBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: double.infinity,
        height: 68.0,
        constraints: const BoxConstraints(maxWidth: 450.0),
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: widget.borderRadius,
          boxShadow: widget.boxShadow,
        ),
        child: Row(
          children: [
            widget.icon,
            const SizedBox(width: 24.0),
            Text(
              widget.message,
              style: theme.textTheme.bodyMedium?.merge(widget.textStyle),
              textAlign: widget.textAlign,
              overflow: TextOverflow.ellipsis,
              maxLines: widget.maxLines,
            ),
          ],
        ),
      ),
    );
  }
}

const kDefaultBoxShadow = [
  BoxShadow(
    color: Colors.black12,
    offset: Offset(0.0, 0.0),
    spreadRadius: 0.0,
    blurRadius: 4.0,
  ),
];

const kDefaultBorderRadius = BorderRadius.all(Radius.circular(12));