import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/screens/questions_screen.dart';
import 'package:quizapp/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
List<String> selectedAnswers = [];
var activeScreen = 'start-screen';

  void switchScreen(){
    setState(() {
      activeScreen =  'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = [];
        activeScreen = 'start-screen';
      });
    }
  }
  // Widget? activeScreen;
  /*@override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }*/

  @override
  Widget build(BuildContext context) {

    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient:  LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 122, 70, 212),
                  Color.fromARGB(255, 71, 38, 128),
                ]
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
