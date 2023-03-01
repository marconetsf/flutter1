import 'package:flutter/material.dart';
import 'Task.dart';
import 'ColorFull.dart';
import 'MyFirstWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacidade = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: const Text('Tarefas'),
        ),
        body: AnimatedOpacity(duration: Duration(milliseconds: 800),
          opacity: opacidade == true ? 1 : 0,
          child: ListView(
            children: const [
              Task('Aprender Flutter', 0,
                  'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large'),
              Task('Aprender Material Design', 4,
                  'https://tswbike.com/wp-content/uploads/2020/09/108034687_626160478000800_2490880540739582681_n-e1600200953343.jpg'),
              Task('Aprender Cupertino Design', 5,
                  'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg'),
              Task('Aprender OOP', 5,
                  'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg'),
              Task('Aprender Flutter', 4,
                  'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg'),
              Task('Aprender Material Design', 1,
                  'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large'),
              Task('Aprender Cupertino Design', 3,
                  'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg'),
              Task('Aprender OOP', 4,
                  'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg'),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(()
            {
              opacidade = !opacidade;
            });
        },
            child: Icon(Icons.remove_red_eye),),
    ),);
  }
}
