import 'package:flutter/material.dart';

class ColorFull extends StatelessWidget {
  final Color cor1;
  final Color cor2;
  final Color cor3;

  const ColorFull(this.cor1, this.cor2, this.cor3, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 150,
          width: 100,
          decoration: BoxDecoration(
            color: cor1,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.black,
              width: 3,
            ),),
        ),
        Container(
            height: 150,
            width: 100,
            decoration: BoxDecoration(
              color: cor2,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black,
                width: 3,
              ),),
            child: Icon(Icons.people_alt_sharp)
        ),
        Container(
          height: 150,
          width: 100,
          decoration: BoxDecoration(
            color: cor3,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.black,
              width: 3,
            ),),
        ),
      ],
    );
  }
}