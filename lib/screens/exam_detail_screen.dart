import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({required this.exam, super.key});

  String _timeRemaining() {
    final now = DateTime.now();
    final difference = exam.dateTime.difference(now);

    if (difference.isNegative) {
      return "Испитот е веќе поминат";
    }

    final days = difference.inDays;
    final hours = difference.inHours % 24;
    return "Преостануваат $days дена, $hours часа до испитот";
  }

  @override
  Widget build(BuildContext context) {
    bool isPast = exam.dateTime.isBefore(DateTime.now());

    return Scaffold(
      appBar: AppBar(title: Text(exam.subject)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Име на предмет:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(exam.subject),
            SizedBox(height: 16),
            Text('Датум и време:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(DateFormat('dd.MM.yyyy HH:mm').format(exam.dateTime)),
            SizedBox(height: 16),
            Text('Простории:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(exam.rooms.join(', ')),
            SizedBox(height: 16),
            Text('Време до испит:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(_timeRemaining()),
          ],
        ),
      ),
    );
  }
}
