

import 'package:fare/core/res/media_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../features/language/presentation/widget/language_drop_down_widget.dart';
import '../../features/theme/presentation/page/theme_drowp_down_widget.dart';

class MenuBarWidget extends StatefulWidget {
  const MenuBarWidget({super.key});

  @override
  State<MenuBarWidget> createState() => _MenuBarWidgetState();
}

class _MenuBarWidgetState extends State<MenuBarWidget> {
  @override
  Widget build(BuildContext context) {

    return Column(
      
      children: [
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 16),
           child: SvgPicture.asset(MediaRes.logo),
         ),

        LanguageDropDownWidget(),

        ThemeDrowpDownWidget()
      ],
    );
  }
}
