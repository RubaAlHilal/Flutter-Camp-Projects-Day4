// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intro_flutter/tasks_page.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}
// ##################################################################

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/":(context) => Home_Page(),
        TasksPage.routeName :(context) => TasksPage(),
      },
    );
  }
}
