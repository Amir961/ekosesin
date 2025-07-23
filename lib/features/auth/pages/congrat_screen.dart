import 'package:fare/core/components/text/text.dart';
import 'package:fare/core/res/media_res.dart';
import 'package:fare/core/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../home/pages/home_screen.dart';



class CongrateScreen extends StatefulWidget {
  static const routeName = '/congrate-screen';
  const CongrateScreen({super.key});

  @override
  State<CongrateScreen> createState() => _CongrateScreenState();
}

class _CongrateScreenState extends State<CongrateScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    goToMain();
  }

  goToMain() async{

    await Future.delayed(Duration(seconds: 3));
    context.go(HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height:  MediaQuery.of(context).size.height,
          width:  MediaQuery.of(context).size.width,
          color: MyColors.primaryColor,
          alignment:Alignment.center,
          child: Image.asset(MediaRes.logo)


        )
    );
  }
}