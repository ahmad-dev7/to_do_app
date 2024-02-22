import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:to_do/components/icon_button.dart';
import 'package:to_do/model/tasks.dart';

class TaskContainer extends StatelessWidget {
  final Function() onTap; // setState(() => current = index);
  final Function(int id) onDelete;
  final Function(Tasks task) onEdit, onComplete;
  final bool isActive;
  final Tasks task;
  const TaskContainer({
    super.key,
    required this.onTap,
    required this.isActive,
    required this.task,
    required this.onDelete,
    required this.onEdit,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        padding: const EdgeInsets.all(12),
        duration: const Duration(milliseconds: 400),
        margin: EdgeInsets.only(right: isActive ? 12 : 30, bottom: 15, top: 15),
        height: isActive ? 160 : 140,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/wavy_lines.jpg'),
            fit: BoxFit.fill,
            opacity: isActive ? 0.3 : 0,
          ),
          color: task.isDone
              ? Colors.green.withOpacity(isActive ? 0.7 : 0.1)
              : isActive
                  ? const Color(0xFF2B3032)
                  : Colors.transparent.withAlpha(10),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            // Heading
            Positioned(
              top: 8,
              child: text(
                task.heading,
                isActive: isActive,
                weight: FontWeight.w600,
                size: 18,
              ),
            ),
            // Time
            Positioned(
              top: 0,
              right: 5,
              child: text(
                task.time,
                isActive: isActive,
                weight: FontWeight.w400,
              ),
            ),
            // About
            Positioned(
              top: 45,
              right: 0,
              left: 0,
              child: text(
                task.about,
                isActive: isActive,
              ),
            ),
            // Show delete/edit/complete buttons
            if (isActive)
              Positioned(
                bottom: -5,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //! Delete button
                    CustomIconButton(
                      onTap: () => onDelete(task.id),
                      bgColor: task.isDone
                          ? Colors.transparent
                          : const Color(0xFF292D2D),
                      color: task.isDone
                          ? Colors.red
                          : Colors.red.withOpacity(0.8),
                      icon: task.isDone
                          ? Icons.delete_forever_sharp
                          : Icons.delete,
                    ),
                    SizedBox(width: task.isDone ? 0 : 20),
                    //? Edit button
                    Visibility(
                      visible: !task.isDone,
                      child: CustomIconButton(
                        onTap: () => onEdit(task),
                        color: Colors.blue,
                        icon: Icons.edit,
                      ),
                    ),
                    SizedBox(width: task.isDone ? 0 : 20),
                    //* Completed button
                    Visibility(
                      visible: !task.isDone,
                      child: CustomIconButton(
                        onTap: () => onComplete(task),
                        color: Colors.green,
                        icon: Icons.check,
                      ),
                    ),
                  ],
                ),
              ).animate().slideX(duration: const Duration(milliseconds: 400)),
          ],
        ),
      ),
    );
  }

  Widget text(
    String text, {
    required bool isActive,
    double? size,
    FontWeight? weight,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: isActive ? Colors.white : Colors.black87,
        fontSize: size ?? 14,
        fontWeight: weight ?? FontWeight.w300,
      ),
    );
  }
}
