

import 'package:flutter/material.dart';

import '../bottom_sheet/bottom_sheet_widget.dart';
import 'home_page.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: HomePage()),
      bottomNavigationBar:  ButtomSheetWidget()

    );
  }
}


