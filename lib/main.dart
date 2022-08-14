import 'package:flutter/material.dart';
import 'package:guess_number_t/pages/game_page.dart';

void main() {
  runApp(const MyApp()); //new MyApp
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      //send parameter to MaterialAPp
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: GamePage(),
    );
  }
}

