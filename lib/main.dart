import 'package:flutter/material.dart';

import 'home_screen.dart';

void main(){
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Todo App',
      home: HomeScreen(),
    );
  }
}
