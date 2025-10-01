
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../inherited/tablet_checker/app_provider.dart';

class SvgString extends StatelessWidget {
  final String svgString;
  final double width;
  final double height;
  const SvgString({super.key,this.height=24,this.width=24, required this.svgString});


  @override
  Widget build(BuildContext context) {
    final isDark = AppProvider.of(context).isDark ;
    final iconColor = isDark ? Colors.white : Colors.black;
    return  SvgPicture.string(
      svgString,
      width: width,
      height: height,
      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
    );
  }
}
