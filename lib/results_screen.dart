import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'questions_summary.dart';
class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key,required this.chosenAnswers,required this.restart});
  final List<String> chosenAnswers;
  final void Function() restart ;

  List<Map<String,Object>>getSummaryData(){
    final List<Map<String,Object>> summary=[];
    for(var i=0;i<chosenAnswers.length;i++){
      summary.add({
        "Question_index":i,
        "question":questions[i].text,
        "correct_answer": questions[i].answers[0],
        "chosen_answer":chosenAnswers[i]
      });
    }return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData=getSummaryData();
    final numTotalQuestions=questions.length;
    final numCorrectQuestions=summaryData.where((data){
      return data['chosen_answer']== data['correct_answer'];
    }).length;


    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You answered $numCorrectQuestions out of $numTotalQuestions questions",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 107, 137, 234),
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(height: 30,),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30,),
            OutlinedButton.icon(onPressed: restart,
              icon: const Icon(Icons.restart_alt),
              label: const Text("Restart Quiz"),
            )

          ],
        ),
      ),

    );
  }
}
