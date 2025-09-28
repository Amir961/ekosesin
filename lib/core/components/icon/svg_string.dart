
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgString extends StatelessWidget {
  final String svgString;
  final double width;
  final double height;
  const SvgString({super.key,this.height=24,this.width=24, required this.svgString});


  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDark ? Colors.white : Colors.black;
    return  SvgPicture.string(
      svgString,
      width: width,
      height: height,
      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
    );
  }
}
