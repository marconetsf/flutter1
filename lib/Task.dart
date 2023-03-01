import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String task;
  final String photo;
  final int dificuldade;

  const Task(this.task, this.dificuldade, this.photo, {Key? key})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 1;

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
                                    color: widget.dificuldade >= 1
                                        ? Colors.blue
                                        : Colors.blue[100],
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: widget.dificuldade >= 2
                                        ? Colors.blue
                                        : Colors.blue[100],
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: widget.dificuldade >= 3
                                        ? Colors.blue
                                        : Colors.blue[100],
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: widget.dificuldade >= 4
                                        ? Colors.blue
                                        : Colors.blue[100],
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: widget.dificuldade >= 5
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
                                nivel++;
                              });
                              print(nivel);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(Icons.arrow_drop_up),
                                Text("Up"),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.dificuldade > 0)
                              ? ((nivel / widget.dificuldade * 2) / 10)
                              : 1,
                        ),
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Nivel $nivel',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}