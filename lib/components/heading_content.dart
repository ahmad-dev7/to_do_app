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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xF6FFFFFF),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              const Text('Hey,'),
              const SizedBox(width: 5),
              Text(
                userName,
                style: style(
                  size: 18,
                  weight: FontWeight.w500,
                  color: const Color(0xff313638),
                ),
              ),
            ],
          ),
        ),

        Text(
          'Completed your task ?!?!',
          style: style(
            size: 18,
            weight: FontWeight.w500,
            letterSpacing: 5,
            color: Colors.white70,
          ),
        ),

        ListTile(
          contentPadding: const EdgeInsets.only(),
          title: Text('Today', style: style(weight: FontWeight.bold, size: 22)),
          subtitle: Text(today, style: style()),
        )

        // RichText(
        //   text: TextSpan(
        //     text: 'Hey, ',
        //     style: style(size: 19, color: Colors.grey[400]),
        //     children: [
        //       TextSpan(
        //         text: userName,
        //         style: style(
        //           color: Colors.grey[300],
        //           weight: FontWeight.w500,
        //           size: 20,
        //           letterSpacing: 0,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // Text(
        //   'Completed your tasks !!!',
        //   style: style(
        //     size: 19,
        //     color: Colors.grey[400],
        //     wordSpacing: 3,
        //     letterSpacing: 2,
        //   ),
        // ),
        // const SizedBox(),
        // Text(
        //   'Today',
        //   style: style(
        //     color: Colors.grey[300],
        //     size: 20,
        //     weight: FontWeight.w600,
        //     letterSpacing: 0,
        //   ),
        // ),
        // Text(
        //   today,
        //   style: style(
        //     color: Colors.grey[400],
        //     wordSpacing: 3,
        //     weight: FontWeight.w500,
        //     size: 14,
        //   ),
        // ),
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
    color: color ?? const Color(0xF5FFFFFF),
    fontSize: size ?? 14,
    fontWeight: weight ?? FontWeight.w400,
  );
}
