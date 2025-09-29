

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAssets extends StatelessWidget {
  final String address;
  final double width;
  final double height;

  const SvgAssets({super.key,this.height=24,this.width=24, required this.address});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDark ? Colors.white : Colors.black;

    return  SvgPicture.asset(
      address,
      width: width,
      height: height,
      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
    );
  }
}