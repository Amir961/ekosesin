

import 'package:fare/features/auth/pages/congrat_screen.dart';
import 'package:fare/features/auth/pages/intro_screen.dart';
import 'package:fare/features/auth/pages/login_screen.dart';
import 'package:fare/features/auth/pages/sign_in_screen.dart';
import 'package:fare/features/auth/pages/verify-code-screen.dart';
import 'package:fare/features/home/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/cubit/timer_cubit.dart';
import '../../features/auth/cubit/update_duration_cubit.dart';
import '../../features/salon/pages/details_salon_screen.dart';
import '../../features/salon/pages/salon_screen.dart' show SalonScreen;
import '../../features/splash/presentation/pages/splash_screen.dart';
import '../../injection_container.dart';


final GoRouter router = GoRouter (
  initialLocation: SplashScreen.routeName,
  routes: <RouteBase>[
    GoRoute(
      path: SplashScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        //final userData = state.extra as UserData;
        return const SplashScreen();
      },
    ),

    GoRoute(
      path: IntroScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        //final userData = state.extra as UserData;
        return const IntroScreen();
      },
    ),

    GoRoute(
      path: LoginScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        //final userData = state.extra as UserData;
        return const LoginScreen();
      },
    ),

    GoRoute(
      path: HomeScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        //final userData = state.extra as UserData;
        return const HomeScreen();
      },
    ),

    GoRoute(
      path: VerifyCodeScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return  MultiBlocProvider(
          key: const ValueKey(2),
          providers: [

            BlocProvider<TimerCubit>(
              create: (context) => sl<TimerCubit>(),
            ),
            BlocProvider<UpdateDurationCubit>(
              create: (context) => sl<UpdateDurationCubit>(),
            ),
          ],
          child: const VerifyCodeScreen(),
        );



      },
    ),

    GoRoute(
      path: CongrateScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        //final userData = state.extra as UserData;
        return const CongrateScreen();
      },
    ),

    GoRoute(
      path: SignInScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        //final userData = state.extra as UserData;
        return const SignInScreen();
      },
    ),

    GoRoute(
      path: SalonScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        //final userData = state.extra as UserData;
        return const SalonScreen();
      },
    ),

    GoRoute(
      path: DetailsSalonScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
       final id = state.extra as String;
        return  DetailsSalonScreen(id: id,);
      },
    ),







  ]);