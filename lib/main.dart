import 'package:flutter/material.dart';
import 'package:task_app/utils/colors.dart';

import 'get_started.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(primaryColor: primary),
      home: const GetStarted(),
    );
  }
}


