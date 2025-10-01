

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../inherited/tablet_checker/app_provider.dart';

class SvgAssets extends StatelessWidget {
  final String address;
  final double width;
  final double height;

  const SvgAssets({super.key,this.height=24,this.width=24, required this.address});

  @override
  Widget build(BuildContext context) {
    final isDark = AppProvider.of(context).isDark ;
    final iconColor = isDark ? Colors.white : Colors.black;

    return  SvgPicture.asset(
      address,
      width: width,
      height: height,
      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
    );
  }
}