import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        style: ButtonStyle(backgroundColor:
            MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) return Colors.purple[500];
          return Colors.grey[500];
        })),
        onPressed: selectHandler,
        child: Text(answerText),
      ),
    );
  }
}
