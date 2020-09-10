import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_prototype2_app/add_task_screen.dart';
import 'package:todo_prototype2_app/task_screen.dart';
import 'package:todo_prototype2_app/task_view_model.dart';

void main() {
  print('Welcome Todo App !!!');
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskScreen(),
      title: 'TODO ',
      theme: ThemeData.dark().copyWith(primaryColor: Colors.cyan),
      initialRoute: TaskScreen.id,
      routes: {
        TaskScreen.id: (context) => TaskScreen(),
        AddTaskScreen.id: (context) => AddTaskScreen(),
      },
    );
  }
}
