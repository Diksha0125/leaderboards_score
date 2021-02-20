import 'package:flutter/material.dart';
import 'package:leader_board_score/ui/home.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'LeaderBoard Scores'),
    );
  }
}
