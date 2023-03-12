import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  final BuildContext taskContext;

  const FormScreen({Key? key, required this.taskContext}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar:
            AppBar(title: Text('New Task')),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 650,
              width: 375,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value != null) {
                          if (value.isEmpty) {
                            return 'Insert new task name';
                          }
                        }
                        return null;
                      },
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Name',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value != null) {
                          if (value.isEmpty ||
                              int.parse(value) < 1 ||
                              int.parse(value) > 5) {
                            return 'Insert a difficult between 1 and 5';
                          }
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: difficultyController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Difficulty',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value != null) {
                          if (value.isEmpty) {
                            return 'Insert an URL';
                          }
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      onChanged: (text) {
                        setState(() {});
                      },
                      controller: imageController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Image',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.black),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageController.text,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.asset(
                            'assets/images/Nophoto-512.webp',
                          );
                        },
                        fit: BoxFit.cover,

                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          TaskInherited.of(widget.taskContext).newTask(nameController.text, imageController.text, int.parse(difficultyController.text));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('New task was added'),
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Add')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
