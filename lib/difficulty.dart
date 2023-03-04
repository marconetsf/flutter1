import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {

  final int level;
  final int difficultLevel;

  const Difficulty({
    Key? key,
    required this.level,
    required this.difficultLevel,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            child: LinearProgressIndicator(
              color: Colors.white,
              value: (difficultLevel > 0)
                  ? ((level / difficultLevel * 2) / 10)
                  : 1,
            ),
            width: 200,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'Nivel $level',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}