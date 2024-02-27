import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:to_do/Services/task_services.dart';

class HeadingContent extends StatelessWidget {
  const HeadingContent({super.key});

  @override
  Widget build(BuildContext context) {
    String today = DateFormat('EEEE, d MMMM', 'en_US').format(DateTime.now());
    String userName = userInfo.get('name');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 30,
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xDFF8F7F4),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Text('Hello,'),
              const SizedBox(width: 5),
              Text(
                userName,
                style: style(
                  size: 18,
                  weight: FontWeight.w400,
                  color: const Color(0xE0000000),
                ),
              ),
            ],
          ),
        ).animate().slideX(),
        Text(
          'Completed your task ?!?!',
          style: style(
            size: 18,
            weight: FontWeight.w300,
            letterSpacing: 2,
            color: const Color(0xE1FFFFFF),
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          title: Text('Today', style: style(weight: FontWeight.w200, size: 22)),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
            child: Text(today, style: style(weight: FontWeight.w400)),
          ),
        )
      ],
    ).animate().slideX();
  }
}

TextStyle style({
  Color? color,
  double? size,
  FontWeight? weight,
  double? wordSpacing,
  double? letterSpacing,
  TextDecoration? decoration,
}) {
  return TextStyle(
    wordSpacing: wordSpacing,
    letterSpacing: letterSpacing,
    decoration: decoration,
    decorationColor: Colors.grey[500],
    color: color ?? const Color(0xFFFFFFFF),
    fontSize: size ?? 14,
    fontWeight: weight ?? FontWeight.w400,
  );
}
