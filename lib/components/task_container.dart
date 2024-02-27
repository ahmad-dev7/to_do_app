import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:to_do/components/icon_button.dart';
import 'package:to_do/components/lottie_animation_player.dart';
import 'package:to_do/model/tasks.dart';

class TaskContainer extends StatefulWidget {
  final Function() onTap;
  final Future<void> Function(int id) onDelete;
  final Future<void> Function(Tasks task) onEdit, onComplete;
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
  State<TaskContainer> createState() => _TaskContainerState();
}

class _TaskContainerState extends State<TaskContainer> {
  bool playDeleteAnimation = false;
  bool playCompleteAnimation = false;
  bool playEditAnimation = false;
  void showDeleteAnimation() => setState(() => playDeleteAnimation = true);
  void removeDeleteAnimation() {
    widget.onDelete(widget.task.id).whenComplete(
          () => setState(() => playDeleteAnimation = false),
        );
  }

  showCompleteAnimation() {
    setState(() => playCompleteAnimation = true);
    widget.onComplete(widget.task);
  }

  showEditAnimation() {
    setState(() => playEditAnimation = true);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: AnimatedContainer(
        padding: const EdgeInsets.all(12),
        duration: const Duration(milliseconds: 400),
        margin: EdgeInsets.only(
            right: widget.isActive ? 12 : 30, bottom: 15, top: 15),
        height: widget.isActive ? 160 : 140,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/wavy_lines.jpg'),
            fit: BoxFit.fill,
            opacity: widget.isActive ? 0.3 : 0,
          ),
          color: widget.task.isDone
              ? Colors.green.withOpacity(widget.isActive ? 0.7 : 0.1)
              : widget.isActive
                  ? const Color(0xFF2B3032)
                  : Colors.transparent.withAlpha(10),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Visibility(
          visible: !playDeleteAnimation,
          replacement: LottieAnimationPlayer(
            filePath: 'images/delete.json',
            onComplete: removeDeleteAnimation,
          ),
          child: Visibility(
            visible: !playEditAnimation,
            replacement: Padding(
              padding: const EdgeInsets.all(25),
              child: LottieAnimationPlayer(
                filePath: 'images/update.json',
                onComplete: () => setState(() => playEditAnimation = false),
              ).animate().fade(),
            ),
            child: Stack(
              children: [
                // Heading
                Positioned(
                  top: 8,
                  child: text(
                    widget.task.heading,
                    isActive: widget.isActive,
                    weight: FontWeight.w600,
                    size: 18,
                  ),
                ),
                // Time
                Positioned(
                  top: 0,
                  right: 5,
                  child: text(
                    widget.task.time,
                    isActive: widget.isActive,
                    weight: FontWeight.w400,
                  ),
                ),
                // About
                Positioned(
                  top: 45,
                  right: 0,
                  left: 0,
                  child: text(
                    widget.task.about,
                    isActive: widget.isActive,
                  ),
                ),
                // Show delete/edit/complete buttons
                if (widget.isActive)
                  Positioned(
                    bottom: -5,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //! Delete button
                        CustomIconButton(
                          onTap: () => showDeleteAnimation(),
                          bgColor: widget.task.isDone
                              ? Colors.transparent
                              : const Color(0xFF292D2D),
                          color: widget.task.isDone
                              ? Colors.red
                              : Colors.red.withOpacity(0.8),
                          icon: widget.task.isDone
                              ? Icons.delete_forever_sharp
                              : Icons.delete,
                        ),
                        SizedBox(width: widget.task.isDone ? 0 : 20),
                        //? Edit button
                        Visibility(
                          visible: !widget.task.isDone,
                          child: CustomIconButton(
                            onTap: () => widget
                                .onEdit(widget.task)
                                .whenComplete(() => showEditAnimation()),
                            color: Colors.blue,
                            icon: Icons.edit,
                          ),
                        ),
                        SizedBox(width: widget.task.isDone ? 0 : 20),
                        //* Completed button
                        Visibility(
                          visible: !widget.task.isDone,
                          child: CustomIconButton(
                            onTap: () => showCompleteAnimation(),
                            color: Colors.green,
                            icon: Icons.check,
                          ),
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .slideX(duration: const Duration(milliseconds: 400)),
                // Completed task animation
                Visibility(
                  visible: playCompleteAnimation,
                  child: LottieAnimationPlayer(
                    filePath: 'images/celebration.json',
                    onComplete: () =>
                        setState(() => playCompleteAnimation = false),
                  ),
                )
              ],
            ),
          ),
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
