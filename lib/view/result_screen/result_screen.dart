import 'package:flutter/material.dart';
import 'package:quizapp_model/utils/color_constant.dart';
import 'package:quizapp_model/utils/sample_questions/sample_questions.dart';
import 'package:quizapp_model/view/question_screen/question_screen.dart';

class ResultScreen extends StatelessWidget {
  // const ResultScreen({super.key});

// changed
  int count;

  ResultScreen({required this.count});

  @override
  Widget build(BuildContext context) {
    // ch
    int totalQn = Questiondb.question.length;
    double percentage = (count / totalQn) * 100;
    return Scaffold(
      backgroundColor: Colorconstant.mycustomblack,
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "congrats!",
              style:
                  TextStyle(color: Colorconstant.mycustomwhite, fontSize: 30),
            ),
            Text(
              // ch
              "${percentage}%score",
              // .toStringAsFixed(0)
              style:
                  TextStyle(color: Colorconstant.mycustomgreen, fontSize: 30),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Colorconstant.mycustomorange),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestionScreen(),
                    ));
              },
              child: Text(
                "Restart",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
