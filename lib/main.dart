import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:task_app/bloc/started/bloc/started_bloc.dart';
import 'package:task_app/database/app_database.dart';
import 'package:task_app/home.dart';
import 'package:task_app/utils/colors.dart';
import 'package:get_it/get_it.dart';

import 'get_started.dart';

void main() {
  GetIt.I.registerSingletonAsync<AppDatabase>(
      () async => $FloorAppDatabase.databaseBuilder("note.db").build());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<StartedBloc>(create: (context) => StartedBloc())
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData.light().copyWith(primaryColor: primary),
            home: AnimatedSplashScreen(
              splash: 'assets/images/man.png',
              backgroundColor: primary,
              nextScreen: const Home(),
              splashTransition: SplashTransition.scaleTransition,
              pageTransitionType: PageTransitionType.fade,
            )));
    /*  */
  }
}
