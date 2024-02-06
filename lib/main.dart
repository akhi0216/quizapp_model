import 'package:flutter/material.dart';
import 'package:quizapp_model/view/question_screen/question_screen.dart';
import 'package:quizapp_model/view/result_screen/result_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuestionScreen(),
      // home: ResultScreen(),
    );
  }
}
