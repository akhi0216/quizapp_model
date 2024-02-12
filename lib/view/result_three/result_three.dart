import 'package:flutter/material.dart';
import 'package:quizapp_model/utils/color_constant.dart';
import 'package:quizapp_model/utils/sample_questions/sample_questions.dart';
import 'package:quizapp_model/view/home_page/hpme_page.dart';
import 'package:quizapp_model/view/question_screen/question_screen.dart';

class ResultThree extends StatelessWidget {
  // const ResultScreen({super.key});

// changed
  int count;
  int rightanswer;
  int wronganswer;
  int skippedcount;
  int totalqn;
  // int? wrongAnswers;

  ResultThree(
      {required this.count,
      required this.rightanswer,
      required this.wronganswer,
      required this.skippedcount,
      required this.totalqn});

  @override
  Widget build(BuildContext context) {
    int totalQn = Questiondb.sciencequestion.length;
    int wrongAnswers = totalQn - count;

    // int skippedQuestions = totalQn - (count + wrongAnswers);
    int skippedQuestions = totalQn - count - wrongAnswers;

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
            Text(
              "Correct Answers: $count",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "Wrong Answers: $wrongAnswers",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "Skipped Questions: $skippedQuestions",
              style: TextStyle(color: Colors.white),
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
                      builder: (context) => HomePage(),
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
