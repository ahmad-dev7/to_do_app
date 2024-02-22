import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

IndicatorStyle tileIndicatorStyle(bool isDone, bool isActive) {
  return IndicatorStyle(
    iconStyle: IconStyle(
      color: isActive || isDone ? Colors.white : Colors.grey.shade600,
      iconData: isDone ? Icons.check : Icons.calendar_month,
    ),
    width: 25,
    color: isDone
        ? Colors.green
        : isActive
            ? Colors.black
            : Colors.grey.shade400,
    padding: const EdgeInsets.symmetric(
      horizontal: 12,
    ),
  );
}
