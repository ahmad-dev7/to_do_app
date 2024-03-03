import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:to_do/Services/task_services.dart';
import 'package:to_do/components/web_controller.dart';
import 'package:to_do/pages/add_task_sheet.dart';
import 'package:to_do/components/background_container.dart';
import 'package:to_do/components/calendar_container.dart';
import 'package:to_do/components/empty_task_message.dart';
import 'package:to_do/components/heading_container.dart';
import 'package:to_do/components/heading_content.dart';
import 'package:to_do/components/horizontal_calendar.dart';
import 'package:to_do/components/task_container.dart';
import 'package:to_do/components/tile_indicator_style.dart';
import 'package:to_do/model/tasks.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Tasks> taskList;
  String date = DateFormat('E, d MMM').format(DateTime.now());
  int current = 0;
  @override
  void initState() {
    retrieveTask(date);
    super.initState();
  }

  void retrieveTask(String date) {
    setState(() => taskList = TaskServices().getTask(date));
    Future.delayed(const Duration(seconds: 1))
        .then((value) => setState(() => ''));
  }

  @override
  Widget build(BuildContext context) {
    return WebController(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton.extended(
          elevation: 20,
          label: const Text('New Task'),
          icon: const Icon(Icons.add),
          backgroundColor: const Color(0xFF071D38),
          onPressed: onFloatingButtonTap,
        ).animate().slideX(duration: const Duration(milliseconds: 500)),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  //* Top background image
                  const HeadingContainer(
                    height: 250,
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 13,
                          right: 13,
                          top: 15,
                          bottom: 45,
                        ),
                        child: HeadingContent(),
                      ),
                    ),
                  ),

                  //? Task list view builder
                  Positioned(
                    top: 250,
                    left: 0,
                    right: 0,
                    child: BackgroundContainer(
                      child: Visibility(
                        visible: taskList.isNotEmpty,
                        replacement:
                            const EmptyTask(msg: 'No task at this date'),
                        child: ListView.builder(
                          itemCount: taskList.length,
                          itemBuilder: (BuildContext context, int index) {
                            Tasks task = taskList[index];
                            bool isActive = index == current;
                            return Padding(
                              padding: EdgeInsets.only(
                                // Adds padding from top for the first child
                                top: index == 0 ? 25 : 0,
                                // Adds padding from bottom for the last child
                                bottom: index == taskList.length - 1 ? 95 : 0,
                              ),
                              child: TimelineTile(
                                // checks if it is the first tile of timeline
                                isFirst: index == 0,
                                // checks if it is the last tile of timeline
                                isLast: index == taskList.length - 1,
                                // When container is not active
                                beforeLineStyle: LineStyle(
                                  thickness: isActive ? 3 : 2,
                                  color: getColor(task.isDone, isActive),
                                ),
                                // Returns style of the indicator line and icon
                                indicatorStyle: tileIndicatorStyle(
                                  task.isDone,
                                  isActive,
                                ),
                                // Task container
                                endChild: TaskContainer(
                                  onTap: () => onTaskContainerTap(index),
                                  isActive: isActive,
                                  task: task,
                                  onDelete: (taskId) => deleteTask(taskId),
                                  onEdit: (task) => editTask(task),
                                  onComplete: (task) => completeTask(task),
                                ),
                              ).animate().slideY(),
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  //* Horizontal date picker [calender]
                  Positioned(
                    top: 205,
                    right: 0,
                    left: 0,
                    child: CalendarContainer(
                      child: HorizontalCalendar(
                        date: DateTime.now(),
                        onDateSelected: (selectedDate) {
                          setState(() {
                            date = DateFormat('E, d MMM').format(
                              DateTime.parse(selectedDate),
                            );
                            current = 0;
                            retrieveTask(date);
                          });
                        },
                      ).animate().slideX(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Opens a extended [model bottom sheet]  for adding a new [task].
  void onFloatingButtonTap() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (context) => AddTaskSheet(
        onClose: () => setState(
          () {
            retrieveTask(date);
            messageAlert('Task added successfully', Colors.green);
          },
        ),
      ),
    );
  }

  /// Sets [current] variable count same as current index to track the active container
  void onTaskContainerTap(int index) {
    setState(() => current = index);
  }

  /// Edit task of given [task id]
  Future<void> editTask(Tasks task) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (context) => AddTaskSheet(
        onClose: () => setState(() => ''),
        heading: task.heading,
        about: task.about,
        btnLabel: 'Edit',
        time: task.time,
        date: task.date,
        id: task.id,
      ),
    ).then((_) {
      retrieveTask(date);
    });
    return Future.value(null);
  }

  /// Sets the given [task.isDone] of given [task id] as [true]
  Future<void> completeTask(Tasks task) async {
    await TaskServices().completeTask(task).then((value) => retrieveTask(date));
    return Future.value(null);
  }

  /// Deletes the given [task id]
  Future<void> deleteTask(int taskId) async {
    AwesomeNotifications().cancel(taskId);
    await TaskServices().deleteTask(taskId).then((_) {
      retrieveTask(date);
      messageAlert('Task deleted', Colors.red);
    });
    return Future.value(null);
  }

  /// Returns either [green], [black] or [grey] color based on current state of isDone and isActive
  Color getColor(bool isDone, bool isActive) {
    return isDone
        ? Colors.green
        : isActive
            ? Colors.black
            : Colors.grey.shade400;
  }

  /// Shows a bottom scaffold message
  messageAlert(String msg, Color color) {
    return Future.delayed(
            Duration(milliseconds: msg != 'Task deleted' ? 450 : 0))
        .then(
      (value) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: color,
          duration: const Duration(seconds: 2),
          content: Text(msg),
        ),
      ),
    );
  }
}
