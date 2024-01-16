import 'package:flutter/material.dart';
import 'package:quizzler/Widgets/awnsers.dart';
import 'package:quizzler/Widgets/buttons.dart';
import 'package:quizzler/Widgets/questions.dart';
import 'package:quizzler/Widgets/my_questions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter = 0;
  int allTrue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: (counter >= myQuestionsList.length)
                ? Padding(
                    padding: const EdgeInsets.all(20),
                    child: Card(
                      color: Colors.white,
                      elevation: 20,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 30,
                            child: Text(
                              "النتيجة",
                              style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "$allTrue :",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 22),
                                ),
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${myQuestionsList.length - allTrue} :",
                                  style: TextStyle(
                                      color: const Color.fromARGB(255, 8, 4, 4),
                                      fontSize: 22),
                                ),
                                Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          Container(
                            height: 50,
                            child: Buttons(
                              btnChild: Text(
                                "محاولة مرة اخرى",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              press: () {
                                setState(() {
                                  counter = 0;
                                  allTrue = 0;
                                  for (var list in myQuestionsList) {
                                    list.theAwnser = null;
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Questions(questionsList: myQuestionsList[counter]),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ...myQuestionsList.map(
                          (list) => Awnsers(
                            list: list,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Buttons(
                        press: () {
                          setState(() {
                            if (!(counter >= myQuestionsList.length)) {
                              myQuestionsList[counter].theAwnser =
                                  myQuestionsList[counter].isTrue
                                      ? true
                                      : false;
                              myQuestionsList[counter].theAwnser == true
                                  ? allTrue++
                                  : allTrue;
                              counter++;
                            }
                          });
                        },
                        btnChild: Text(
                          "نعم",
                          style: TextStyle(
                            fontSize: 28,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Buttons(
                        press: () {
                          setState(() {
                            if (!(counter >= myQuestionsList.length)) {
                              myQuestionsList[counter].theAwnser =
                                  myQuestionsList[counter].isTrue
                                      ? false
                                      : true;
                              myQuestionsList[counter].theAwnser == true
                                  ? allTrue++
                                  : allTrue;
                              counter++;
                            }
                          });
                        },
                        btnChild: Text(
                          "لا",
                          style: TextStyle(
                            fontSize: 28,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(
        //     Icons.search,
        //     color: Colors.indigo,
        //   ),
        // ),
        backgroundColor: Colors.white,
        title: Text(
          "Quizzler",
          style: TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.indigo,
    );
  }
}
