

import 'package:fare/core/components/button/button_widget.dart';
import 'package:fare/features/salon/pages/salon_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ButtonWidget(loading: false, onClick: (){
      context.push(SalonScreen.routeName);
    }, text: 'سالن', width: 100, height: 45);
  }
}
