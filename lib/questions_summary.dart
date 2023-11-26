import 'package:flutter/material.dart';
import 'styledtext.dart';
class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData,{super.key});
  final List<Map<String,Object>> summaryData;

  Color check( String chose,String correct){
    if(correct==chose) {return const Color.fromARGB(202, 157, 157, 227);}
    else {return const Color.fromARGB(202, 46, 46, 164);}
  }@override
  Widget build(BuildContext context) {
    return SizedBox(
      height:300 ,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data){

            return Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: check(data['chosen_answer'] as String,data['correct_answer'] as String),
                      child: StyledText(((data['Question_index'] as int) +1).toString()),
                    ),
                     const SizedBox(width: 7,),
                           Expanded(
                             child: Text((data['question']as String),
                               style: const TextStyle(
                                 fontSize: 13,
                                 decoration: TextDecoration.none,
                                 color: Colors.white
                               ),
                             ),
                           )


                  ],
                ),
                const SizedBox(height: 10,),
                StyledText(data['chosen_answer'] as String),
                const SizedBox(height: 7,),
                StyledText(data['correct_answer']as String),
                const SizedBox(height: 10,)
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
