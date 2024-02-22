import 'package:flutter/material.dart';

class DateTimePickerButton extends StatefulWidget {
  final Function() onTap;
  final String label;
  final IconData iconData;
  final bool isPicked;
  const DateTimePickerButton({
    super.key,
    required this.onTap,
    required this.label,
    required this.iconData,
    required this.isPicked,
  });

  @override
  State<DateTimePickerButton> createState() => _DateTimePickerButtonState();
}

class _DateTimePickerButtonState extends State<DateTimePickerButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.maxFinite,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: Colors.grey, width: 0.2),
          boxShadow: [
            BoxShadow(
              offset: const Offset(5, 5),
              color: Colors.grey.shade600,
              blurRadius: 15,
              spreadRadius: -1,
            ),
            const BoxShadow(
              offset: Offset(-5, -5),
              color: Colors.white,
              blurRadius: 15,
              spreadRadius: -1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.label,
              style: TextStyle(
                color: widget.isPicked ? Colors.black : const Color(0xFF686868),
              ),
            ),
            Icon(widget.iconData, color: Colors.blueGrey)
          ],
        ),
      ),
    );
  }
}
