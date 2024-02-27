import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomAlert extends StatelessWidget {
  final bool alert;
  const CustomAlert({super.key, required this.alert});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Visibility(
        visible: alert,
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 10),
          width: double.maxFinite,
          height: 50,
          color: Colors.black87,
          child: const Text(
            'Please complete all fields',
            style: TextStyle(color: Colors.white),
          ),
        ).animate().slideY(begin: 0),
      ),
    );
  }
}
