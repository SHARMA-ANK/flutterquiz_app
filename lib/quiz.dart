import 'package:flutter/material.dart';
import 'package:quiz_app/question_screen.dart';
import 'start_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'results_screen.dart';
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

// ignore: camel_case_types
class _QuizState extends State<Quiz> {
  /*Widget ?activeScreen ;

  @override
  void initState() {
    activeScreen =StartScreen(switchScreen);
    super.initState();
  }*/
  List <String> selectedAnswers=[];
  var activeScreen='start-screen';
  void switchScreen(){
    setState(() {
      activeScreen ='questions-screen';
    });
  }
  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length==questions.length){
      setState(() {

        activeScreen='results-screen';
      });
    }
  }void restartQuiz(){
    selectedAnswers=[];

    setState(() {
      activeScreen='questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
     Widget screenWidget =StartScreen(switchScreen);
     if(activeScreen=='questions-screen'){
       screenWidget= QuestionScreen(onSelectAnswer: chooseAnswer);
     }if(activeScreen=='results-screen'){
       screenWidget= ResultsScreen(chosenAnswers: selectedAnswers,restart: restartQuiz,);
     }
    //final screenWidget= activeScreen=='start-screen' ? StartScreen(switchScreen) : const QuestionScreen();
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 34, 51, 138),
              Color.fromARGB(255, 22, 37, 122),
            ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,)
        ),
        child:screenWidget
      ),
    );
  }
}
