import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.imageUrl,
    this.iconColor,
    this.iconSize = 20,
  });

  final String imageUrl;
  final Color? iconColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      AssetImage(
        'assets/icons/$imageUrl',
      ),
      color: iconColor,
      size: iconSize,
    );
  }
}
