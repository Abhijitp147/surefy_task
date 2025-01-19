import 'package:flutter/material.dart';
import 'package:surefy_task/presonal_call_info.dart';
import 'package:surefy_task/surefy_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff5864F8),
      ),
      home: PresonalCallInfo(),
    );
  }
}
