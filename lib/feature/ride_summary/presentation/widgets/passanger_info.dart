import 'package:flutter/material.dart';

class PassengerInfo extends StatelessWidget {
  const PassengerInfo({
    required this.countLabel,
    required this.description,
    super.key,
  });
  final String countLabel;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          countLabel,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        Text(description, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
