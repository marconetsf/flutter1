import 'package:flutter/material.dart';
import 'difficulty.dart';

class Task extends StatefulWidget {
  final String task;
  final String photo;
  final int difficulty;

  const Task(this.task, this.difficulty, this.photo, {Key? key})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.blue),
              height: 140,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white,
                        ),
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            widget.photo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                          width: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.task,
                                style: const TextStyle(
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: widget.difficulty >= 1
                                        ? Colors.blue
                                        : Colors.blue[100],
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: widget.difficulty >= 2
                                        ? Colors.blue
                                        : Colors.blue[100],
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: widget.difficulty >= 3
                                        ? Colors.blue
                                        : Colors.blue[100],
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: widget.difficulty >= 4
                                        ? Colors.blue
                                        : Colors.blue[100],
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: widget.difficulty >= 5
                                        ? Colors.blue
                                        : Colors.blue[100],
                                    size: 15,
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Container(
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                level++;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(Icons.arrow_drop_up),
                                const Text('Up'),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                Difficulty(level: level, difficultLevel: widget.difficulty,),
              ],
            )
          ],
        ),
      ),
    );
  }
}

