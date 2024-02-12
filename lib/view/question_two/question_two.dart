import 'package:flutter/material.dart';
// import 'package:flutter_application_1/utils/color_constant.dart';
// import 'package:flutter_application_1/utils/database.dart';
// import 'package:flutter_application_1/view/resultscreen/resultscreen.dart';
import 'package:quizapp_model/utils/color_constant.dart';
import 'package:quizapp_model/utils/sample_questions/sample_questions.dart';
import 'package:quizapp_model/view/result_screen/result_screen.dart';
import 'package:quizapp_model/view/result_two/result_two.dart';

class Questiontwo extends StatefulWidget {
  const Questiontwo({Key? key}) : super(key: key);

  @override
  State<Questiontwo> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<Questiontwo> {
  int questionindex = 0;
  int? selectedindex;
  int count = 0;
  int rightanswer = 0;
  int wronganswer = 0;
  int skippedcount = 0;
  int totalqn = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconstant.mycustomblack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "${questionindex + 1}/${Questiondb.sportsquestion.length}",
              style: TextStyle(
                color: Colorconstant.mycustomwhite,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          // Progress Bar
          LinearProgressIndicator(
            value: (questionindex + 1) / Questiondb.sportsquestion.length,
            color: Colorconstant.mycustomblue,
            backgroundColor: Colorconstant.mycustomgrey,
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colorconstant.mycustomgrey,
              ),
              child: Text(
                Questiondb.sportsquestion[questionindex]["question"].toString(),
                style: TextStyle(
                  color: Colorconstant.mycustomwhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // 2nd container
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: InkWell(
                  onTap: () {
                    // selectedindex = index;
                    // getcolor(index);
                    // print('selectedindex');
                    // setState(() {});
                    if (selectedindex != null)
                      return; //  to stop selecting multiple answers
                    selectedindex = index;
                    getcolor(index);
                    print('selectedindex');
                    setState(() {});
                  },
                  child: Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                      color: getcolor(index),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 3,
                        color: getcolor(index),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Questiondb.sportsquestion[questionindex]["options"]
                                    [index]
                                .toString(),
                            style: TextStyle(
                              color: Colorconstant.mycustomwhite,
                            ),
                          ),
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colorconstant.mycustomwhite,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, optionIndex) => SizedBox(height: 0),
            itemCount:
                Questiondb.sportsquestion[questionindex]["options"].length,
          ),

          SizedBox(
            height: 10,
          ),

          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Colorconstant.mycustomblue),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
            ),
            onPressed: () {
              if (selectedindex != null &&
                  selectedindex ==
                      Questiondb.sportsquestion[questionindex]["answer"]) {
                count++;
              }
              selectedindex = null;
              if (questionindex + 1 < Questiondb.sportsquestion.length) {
                setState(() {
                  questionindex++;
                });
              } else {
                print('Correct Answers: $count');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                        count: count,
                        rightanswer: rightanswer,
                        wronganswer: wronganswer,
                        skippedcount: skippedcount,
                        totalqn: totalqn),
                  ),
                );
              }
            },
            child: Text(
              "       Next      ",
              style: TextStyle(color: Colors.white),
            ),
          ),

// skip, if the questionindex is less that total qns, increment it,
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (questionindex + 1 < Questiondb.sportsquestion.length) {
                    setState(() {
                      questionindex++;
                      selectedindex = null;
                    });
                  } else {
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => ResultScreen(count: count),
                    //     ));
                  }
                },
                child: Text("Skip"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color getcolor(int index) {
    if (selectedindex != null &&
        index == Questiondb.sportsquestion[questionindex]["answer"]) {
      return Colorconstant.mycustomgreen;
    }
    if (selectedindex == index) {
      if (selectedindex == Questiondb.sportsquestion[questionindex]["answer"]) {
        return Colorconstant.mycustomgreen;
      } else {
        return Colors.red;
      }
    } else {
      return Colorconstant.mycustomgrey;
    }
  }
}
