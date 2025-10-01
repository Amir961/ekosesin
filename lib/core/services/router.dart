

import 'package:fare/features/auth/pages/congrat_screen.dart';

import 'package:fare/features/auth/pages/login_screen.dart';
import 'package:fare/features/auth/pages/sign_in_screen.dart';
import 'package:fare/features/auth/pages/verify-code-screen.dart';
import 'package:fare/features/home/bloc/home_bloc.dart';
import 'package:fare/features/home/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/cubit/timer_cubit.dart';
import '../../features/auth/cubit/update_duration_cubit.dart';

import '../../features/home/bloc/details_poster_bloc.dart';
import '../../features/home/bloc/sorted_bloc.dart';
import '../../features/home/pages/details_posters_screen.dart';
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
      path: LoginScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        //final userData = state.extra as UserData;
        return const LoginScreen();
      },
    ),

    GoRoute(
      path: DetailsPostersScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        final idPoster = state.extra as String;
        //  return const HomeScreen();

        return  MultiBlocProvider(

          providers: [

            BlocProvider<DetailsPosterBloc>(
              create: (context) => sl<DetailsPosterBloc>(),
            ),



          ],
          child:  DetailsPostersScreen(idPoster: idPoster,),
        );

      },
    ),

    GoRoute(
      path: HomeScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        //final userData = state.extra as UserData;
      //  return const HomeScreen();

        return  MultiBlocProvider(
          key: const ValueKey(2),
          providers: [

            BlocProvider<HomeBloc>(
              create: (context) => sl<HomeBloc>(),
            ),

            BlocProvider<SortedBloc>(
              create: (context) => sl<SortedBloc>(),
            ),

          ],
          child: const HomeScreen(),
        );

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









  ]);