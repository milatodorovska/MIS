import 'package:flutter/material.dart';
import 'screens/exams_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Распоред за испити',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: ExamsListScreen(
        studentIndex: '223086',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
