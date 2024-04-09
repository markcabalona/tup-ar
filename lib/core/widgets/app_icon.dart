import 'package:flutter/material.dart';
import 'package:tup_ar/core/constants/assets_constants.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    this.width,
    this.height,
  });
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsConstants.vARIcon,
      width: width ?? 128,
      height: height ?? 128,
    );
  }
}
