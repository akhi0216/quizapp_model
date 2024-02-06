import 'package:flutter/material.dart';
import 'package:quizapp_model/utils/color_constant.dart';
import 'package:quizapp_model/utils/sample_questions/sample_questions.dart';
import 'package:quizapp_model/view/result_screen/result_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int questionindex = 0;
  int? selectedAnswerIndex;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconstant.mycustomblack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              // "5/10",
              "${questionindex + 1}/${Questiondb.question.length}",

              style: TextStyle(
                  color: Colorconstant.mycustomblue,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            // height: 200,
            // width: 400,
            // color: Colors.grey,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colorconstant.mycustomgrey),
            child: Text(
              // Questiondb.question[questionIndex]["question"].toString(),
              Questiondb.question[questionindex]["question"],

              style: TextStyle(
                  color: Colorconstant.mycustomwhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(
            height: 25,
          ),

          // 2nd container

          ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  // onTap: () {
                  //   selectedAnswerIndex = index;
                  //   // changed
                  //   getRightAnswer(index);
                  //   print(selectedAnswerIndex);
                  //   setState(() {});
                  // },
                  onTap: () {
                    // changed and added the if condition here
                    if (selectedAnswerIndex == null) {
                      selectedAnswerIndex = index;
                      // changed
                      getRightAnswer(index);
                      print(selectedAnswerIndex);
                      setState(() {});
                    }
                  },
                  child: Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                        color: getRightAnswer(index),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 3,
                          // color: getRightAnswer(index)
                          color: Colorconstant.mycustomgrey,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            // changed
                            // Questiondb.question[questionindex]["options"]
                            //     [index++],
                            Questiondb.question[questionindex]["options"]
                                [index],

                            style:
                                TextStyle(color: Colorconstant.mycustomwhite),
                          ),
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              // changed
              separatorBuilder: (context, index) => SizedBox(height: 15),
              itemCount: Questiondb.question[questionindex]["options"].length),

          SizedBox(
            height: 30,
          ),

          ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Colorconstant.mycustomblue),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
            onPressed: () {
              if (selectedAnswerIndex != null) {
                count++;
              }
              selectedAnswerIndex = null;
              // changed, added if for not moving to another page if answer is not clicked
              if (selectedAnswerIndex != null) {
                if (questionindex + 1 < Questiondb.question.length) {
                  questionindex++;

                  setState(() {});
                } else {
                  print("correct answers:$count");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        count: count,
                      ),
                    ),
                  );
                }
              }
            },
            child: Text(
              "next",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  // function for answer color

  Color getRightAnswer(int index) {
    if (selectedAnswerIndex != null &&
        index == Questiondb.question[questionindex]["answer"]) {
      return Colorconstant.mycustomgreen;
    }
    if (selectedAnswerIndex == index) {
      if (selectedAnswerIndex == Questiondb.question[questionindex]["answer"]) {
        return Colorconstant.mycustomgreen;
      } else {
        return Colorconstant.myfalsecolor;
      }
    } else {
      return Colorconstant.mycustomgrey;
    }
  }
}
