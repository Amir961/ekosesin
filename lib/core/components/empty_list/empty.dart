

import 'package:fare/core/components/text/text.dart';
import 'package:fare/core/res/media_res.dart';
import 'package:fare/features/language/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../icon/svg_assets.dart';
import '../inherited/tablet_checker/app_provider.dart';

class EmptyWidget extends StatelessWidget {
  final String? text;
  final Widget? updateData;
  const EmptyWidget({this.updateData,this.text,super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AppProvider.of(context).isDark ;
    final backGroundColor = isDark ? Colors.black : Colors.white;
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(10),

      decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius:  BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[800]??Colors.grey,width: 0.7)
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SvgAssets(address:  MediaRes.searchEmpty),
            SizedBox(height: 20,),
            MyText(
              textAlign: TextAlign.center,
              text: text?? Strings.of(context).there_are_no_more_items_display,),
               updateData??SizedBox()
          ],
        ),
      ),
    );
  }
}
