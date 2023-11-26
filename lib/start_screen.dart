import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset(
              "assets/images/quiz-logo.png",
              width: 300,
              color: const Color.fromARGB(137, 217, 161, 163),
            ),
            /*!st way of adding opacity by wrapping the widget with the opacity widget
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                "assets/images/quiz-logo.png",
                width: 300,
              ),
            ),*/
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Learn Flutter the Fun Way!",
              style: TextStyle(color: Colors.white, fontSize: 20,decoration: TextDecoration.none),
            ),
          ),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_circle_right_outlined),
            label: const Text(
              "Start Quiz",
            ),
          )
        ],
      ),
    );
  }
}
