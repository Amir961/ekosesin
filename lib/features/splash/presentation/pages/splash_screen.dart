

import 'dart:async';



import 'package:fare/features/home/pages/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';


import '../../../../core/res/media_res.dart';





class SplashScreen extends StatefulWidget {
  static const routeName = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUpdateAndGoToOtherPage();
  }

  void checkUpdateAndGoToOtherPage() async {




   await Future.delayed(const Duration(seconds: 1));

    goToMain();
  }

  goToMain(){
   // context.go( IntroScreen.routeName);
  context.go( HomeScreen.routeName);

   // context.pushReplacement( AddDashboardScreen.routeName

  //  );
   // BlocProvider<HomeBloc>(
   //   create: (context) => sl<HomeBloc>(),
   // ),
   // Navigator.push(
   //   context,
   //   MaterialPageRoute(
   //     builder: (context) {
   //       return BlocProvider(
   //         create: (_) => sl<HomeBloc>(),
   //         child: const HomeScreen(session: null),
   //       );
   //     },
   //   ),
   // );


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
         padding: EdgeInsets.symmetric(horizontal: 20),
         // color: Colors.blueGrey,
          child: Column(
            children: [
              SizedBox(height: 50,),

              // Center(
              //   child: Image.asset(MediaRes.house),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}


