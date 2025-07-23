import 'package:fare/core/utils/values.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/text/text.dart';
import '../../../../core/utils/assets.dart';

class TimerWidget extends StatelessWidget {
  final String minute;
  final String second;
  final bool isLarge;

  const TimerWidget({
    Key? key,
    this.isLarge = true,
    required this.minute,
    required this.second,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => _timer;

  Widget get _timer => Builder(
        builder: (context) => MyText(
          text: '$minute:$second',
          fontSize: (isLarge) ? 32 : 22,
          fontWeight: Fonts.regular,
          overflow: TextOverflow.ellipsis,
          maxLine: 1,
          color: MyColors.primaryColor,
        ),
      );
}
