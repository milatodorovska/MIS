import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamsListScreen extends StatelessWidget {
  final String studentIndex;

  ExamsListScreen({required this.studentIndex, super.key});

  // Hardcoded list of 10+ exams
  final List<Exam> exams = [
    Exam(subject: 'Вовед во наука на податоци', dateTime: DateTime(2025, 11, 5, 9, 0), rooms: ['Лаб 3']),
    Exam(subject: 'Мобилни информациски системи', dateTime: DateTime(2025, 11, 7, 11, 0), rooms: ['Лаб 2АБ']),
    Exam(subject: 'Бази на податоци', dateTime: DateTime(2025, 11, 10, 14, 0), rooms: ['Лаб 216']),
    Exam(subject: 'Веб програмирање', dateTime: DateTime(2025, 11, 12, 9, 0), rooms: ['Лаб 3']),
    Exam(subject: 'Алгоритми и податочни структури', dateTime: DateTime(2025, 11, 15, 13, 0), rooms: ['Лаб 2АБ']),
    Exam(subject: 'Дигитизација', dateTime: DateTime(2025, 11, 18, 10, 0), rooms: ['Лаб 216']),
    Exam(subject: 'Интернет програмирање на клиентска страна', dateTime: DateTime(2025, 11, 20, 9, 0), rooms: ['Лаб 3']),
    Exam(subject: 'Менаџмент информациски системи', dateTime: DateTime(2025, 11, 22, 12, 0), rooms: ['Лаб 216']),
    Exam(subject: 'Континуирана интеграција и испорака', dateTime: DateTime(2025, 11, 25, 14, 0), rooms: ['Лаб 2АБ']),
    Exam(subject: 'Машинско учење', dateTime: DateTime(2025, 11, 28, 9, 0), rooms: ['Лаб 216']),
  ];

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime)); // Хронолошки по датум

    return Scaffold(
      appBar: AppBar(
        title: Text('Распоред за испити - $studentIndex'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) {
                final exam = exams[index];
                return ExamCard(
                  exam: exam,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (_) => ExamDetailScreen(exam: exam),
                    ));
                  },
                );
              },
            ),
          ),
          Container(
            color: Colors.deepPurple,
            padding: EdgeInsets.all(12),
            alignment: Alignment.center,
            child: Text(
              'Вкупно испити: ${exams.length}',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
