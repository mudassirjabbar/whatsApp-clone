import 'package:flutter/material.dart';
import 'package:whats_app/common/extension/custom_theme_extension.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? iconSize;
  final IconData icon;
  final Color? iconColor;
  final double? minWidth;
  const CustomIconButton(
      {Key? key,
      required this.onPressed,
      this.iconSize,
      required this.icon,
      this.iconColor,
      this.minWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: iconColor ?? context.theme.greyColor,
      ),
      iconSize: iconSize ?? 22,
      splashRadius: 22,
      splashColor: Colors.transparent,
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(minWidth: minWidth ?? 40),
    );
  }
}
