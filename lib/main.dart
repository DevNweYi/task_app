import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/bloc/started/bloc/started_bloc.dart';
import 'package:task_app/database/app_database.dart';
import 'package:task_app/utils/colors.dart';
import 'package:provider/provider.dart';

import 'get_started.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => 
      FutureBuilder<AppDatabase>(future: $FloorAppDatabase.databaseBuilder("note.db").build()),
      child: MultiBlocProvider(
          providers: [
            BlocProvider<StartedBloc>(create: (context) => StartedBloc())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData.light().copyWith(primaryColor: primary),
            home: const GetStarted(),
          )),
    );
    /*  */
  }
}
