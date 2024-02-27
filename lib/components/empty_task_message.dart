import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class EmptyTask extends StatelessWidget {
  final String? msg;
  const EmptyTask({super.key, this.msg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.only(bottom: 100),
      decoration: BoxDecoration(
        color: const Color(0x0F272C2E),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        msg ?? 'No task at this date',
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: Color(0xFF272C2E),
        ),
      ),
    ).animate().slideY();
  }
}
