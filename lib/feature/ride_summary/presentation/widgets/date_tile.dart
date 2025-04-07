import 'package:flutter/material.dart';

class DateTile extends StatelessWidget {
  const DateTile({required this.title, required this.date, super.key});

  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        Text(
          date,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
