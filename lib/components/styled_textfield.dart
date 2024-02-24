import 'package:flutter/material.dart';

class StyledTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final int? maxLines;
  final FocusNode? focusNode;
  final int charLength;
  const StyledTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.maxLines,
    required this.charLength,
    this.focusNode,
  });

  @override
  State<StyledTextField> createState() => _StyledTextFieldState();
}

class _StyledTextFieldState extends State<StyledTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: Colors.grey, width: 0.1),
        boxShadow: [
          BoxShadow(
            offset: const Offset(5, 5),
            color: Colors.grey.shade600,
            blurRadius: 15,
            spreadRadius: -2,
          ),
          const BoxShadow(
            offset: Offset(-5, -5),
            color: Colors.white,
            blurRadius: 15,
            spreadRadius: -1,
          ),
        ],
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        maxLines: widget.maxLines,
        maxLength: widget.charLength,
        textCapitalization: TextCapitalization.sentences,
        onChanged: (value) => setState(() {}),
        style: const TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: InputBorder.none,
          counterStyle: const TextStyle(height: double.minPositive),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 1,
            ),
          ),
          hintText: widget.hint,
          hintStyle: const TextStyle(color: Color(0xFF686868), fontSize: 15),
        ),
      ),
    );
  }
}
