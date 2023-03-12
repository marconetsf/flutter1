import 'package:nosso_primeiro_projeto/components/difficulty.dart';
import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  final String name;
  final String photo;
  final int difficulty;

  const Tasks(this.name, this.photo, this.difficulty, {Key? key})
      : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  int level = 1;

  void levelUp() {
    setState(() {
      level++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.blue,
            ),
            height: 140,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black12,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: widget.photo.contains('http')
                            ? Image.network(
                                widget.photo,
                                height: 100,
                                width: 72,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                widget.photo,
                                height: 100,
                                width: 72,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.name,
                            style: const TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Difficulty(widget.difficulty),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                          onPressed: levelUp,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                'UP',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: widget.difficulty > 0
                            ? ((level / widget.difficulty) / 10)
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Level: $level',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
