import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({required this.exam, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    bool isPast = exam.dateTime.isBefore(DateTime.now());

    return Card(
      color: isPast ? Colors.white12 : Colors.white,
      child: ListTile(
        onTap: onTap,
        title: Text(exam.subject, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(Icons.calendar_today, size: 16),
              SizedBox(width: 6),
              Text(DateFormat('dd.MM.yyyy').format(exam.dateTime)),
            ]),
            Row(children: [
              Icon(Icons.access_time, size: 16),
              SizedBox(width: 6),
              Text(DateFormat('HH:mm').format(exam.dateTime)),
            ]),
            Row(children: [
              Icon(Icons.location_on, size: 16),
              SizedBox(width: 6),
              Expanded(child: Text(exam.rooms.join(', '))),
            ]),
          ],
        ),
      ),
    );
  }
}
