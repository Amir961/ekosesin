import 'package:flutter/material.dart';



class TabToolbar extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;

  const TabToolbar({
    Key? key,
    required this.child,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Container(
      height: 100 + topPadding,
      margin: margin,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(1),
          bottomRight: Radius.circular(1),
        ),
        boxShadow: [

               BoxShadow(
                  color: Theme.of(context).shadowColor,
                  offset: const Offset(0, -4),
                  blurRadius: 21,
                  spreadRadius: 0,
                )

        ],
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 0,
            right: 2,
            left: 2,
          ),
          child: child,
        ),
      ),
    );
  }
}
