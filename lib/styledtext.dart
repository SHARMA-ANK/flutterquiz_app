import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text,{super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Text(
        text,
        style: const TextStyle(
        fontSize: 15,
        color:Color.fromARGB(255, 185, 197, 208),
        decoration: TextDecoration.none,
        ),textAlign: TextAlign.center,
    );
  }
}
