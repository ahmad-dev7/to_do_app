import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:to_do/Services/task_services.dart';
import 'package:to_do/components/date_time_picker_button.dart';
import 'package:to_do/components/dialog_button.dart';
import 'package:to_do/components/styled_textfield.dart';
import 'package:to_do/model/tasks.dart';

class AddTaskSheet extends StatefulWidget {
  final Function() onClose;
  final int? id;
  final String? heading, about, date, time, btnLabel;
  const AddTaskSheet({
    super.key,
    this.id,
    this.heading,
    this.about,
    this.date,
    this.time,
    this.btnLabel,
    required this.onClose,
  });

  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  bool isTimePicked = false;
  bool isDatePicked = false;
  TextEditingController headingController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  FocusNode headingFocus = FocusNode();
  FocusNode aboutFocus = FocusNode();
  String pickedDate = '';
  String pickedTime = '';

  @override
  void initState() {
    if (widget.id != null) {
      headingController.text = widget.heading!;
      aboutController.text = widget.about!;
      pickedDate = widget.date!;
      pickedTime = widget.time!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.fastEaseInToSlowEaseOut,
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: SizedBox(
        height: 430,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              //* dialog sheet
              child: sheetContainer(
                height: 380,
                img: 'images/wavy_lines.jpg',
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //* Heading textfield
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: StyledTextField(
                        focusNode: headingFocus,
                        hint: 'Task heading',
                        controller: headingController,
                        charLength: 30,
                      ),
                    ),
                    // About textfield
                    StyledTextField(
                      focusNode: aboutFocus,
                      hint: 'About task',
                      controller: aboutController,
                      charLength: 150,
                      maxLines: 3,
                    ),
                    //* Date and Time picker
                    Flexible(
                      child: Row(
                        children: [
                          //* Date picker button
                          Flexible(
                            flex: 1,
                            child: DateTimePickerButton(
                              onTap: () {
                                // remove focus from textfield
                                setState(() {
                                  headingFocus.unfocus();
                                  aboutFocus.unfocus();
                                });
                                //* Show date picker and set it's value to pickedDate
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now().add(
                                    const Duration(days: 30),
                                  ),
                                ).then(
                                  (value) => setState(
                                    () {
                                      isDatePicked = true;
                                      pickedDate =
                                          DateFormat('E, d MMM').format(value!);
                                    },
                                  ),
                                );
                              },
                              label: pickedDate.isNotEmpty
                                  ? pickedDate
                                  : 'Due date',
                              isPicked: isDatePicked,
                              iconData: Icons.calendar_month,
                            ),
                          ),
                          const SizedBox(width: 40),
                          //* Time picker button
                          Flexible(
                            flex: 1,
                            child: DateTimePickerButton(
                              onTap: () {
                                setState(() {
                                  headingFocus.unfocus();
                                  aboutFocus.unfocus();
                                });
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.fromDateTime(
                                    DateTime.now().add(
                                      const Duration(hours: 1),
                                    ),
                                  ),
                                ).then(
                                  (value) => setState(
                                    () {
                                      pickedTime = getTime(value!);
                                      isTimePicked = true;
                                    },
                                  ),
                                );
                              },
                              label: pickedTime.isNotEmpty
                                  ? pickedTime
                                  : 'Due time',
                              isPicked: isTimePicked,
                              iconData: Icons.av_timer,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //* Add/Edit or cancel button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Cancel button
                        const DialogButton(
                            label: 'Cancel', color: Colors.white10),
                        const SizedBox(width: 40),
                        //! Add/Edit button
                        DialogButton(
                          label: widget.btnLabel ?? 'Add',
                          color:
                              isFieldsCompleted() ? Colors.blue : Colors.grey,
                          onTap: () {
                            //* Check if input fields are nto empty
                            if (isFieldsCompleted()) {
                              int id =
                                  taskBox.isEmpty ? 0 : taskCount.keys.last + 1;
                              TaskServices()
                                  .addTask(
                                task: Tasks(
                                  id: widget.id ?? id,
                                  heading: headingController.text,
                                  about: aboutController.text,
                                  date: pickedDate,
                                  time: pickedTime,
                                  isDone: false,
                                ),
                                isEdit: widget.id == null ? false : true,
                              )
                                  .then(
                                (value) {
                                  setState(
                                    () {
                                      widget.onClose();
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                              );
                            } else {
                              showAlert();
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ).animate().slideY(
                  begin: MediaQuery.of(context).size.height,
                  end: 0,
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 300),
                ),
            //* To-Do icon placed at top
            Positioned.fill(
              top: -10,
              child: Align(
                alignment: Alignment.topCenter,
                child: SimpleShadow(
                  offset: const Offset(10, 10),
                  color: Colors.black,
                  sigma: 10,
                  child: Image.asset(
                    'images/list_icon.png',
                    height: 100,
                  ),
                )
                    .animate()
                    .fade(delay: const Duration(milliseconds: 400))
                    .then()
                    .shake(),
              ),
            ),
            //* Alert add action if fields are not completed
            Center(
              child: Visibility(
                visible: alert,
                child: const Chip(
                  label: Text('Please complete all fields'),
                  labelStyle: TextStyle(color: Colors.white),
                  backgroundColor: Colors.black54,
                ).animate().fade(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool alert = false;
  //* Show alert on add action if fields are not completed
  void showAlert() {
    setState(() => alert = true);
    Future.delayed(const Duration(seconds: 2))
        .then((value) => setState(() => alert = false));
  }

  //* Check if the all fields are filed or not
  bool isFieldsCompleted() {
    if (headingController.text.isNotEmpty &&
        aboutController.text.isNotEmpty &&
        pickedTime.isNotEmpty &&
        pickedDate.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  //* Converts picked time in HH:MM AM/PM format
  String getTime(TimeOfDay value) {
    String time = value.hourOfPeriod.toString().length.isOdd
        ? "0${value.hourOfPeriod}"
        : "${value.hourOfPeriod}";
    time +=
        ':${value.minute.toString().length.isOdd ? '0${value.minute}' : '${value.minute}'}';
    time += value.hour >= 12 ? ' PM' : ' AM';
    return time;
  }
}

Container sheetContainer(
    {required double height, required String img, required Widget child}) {
  return Container(
    height: height,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage(img),
          opacity: 0.2,
          fit: BoxFit.cover,
          colorFilter: const ColorFilter.linearToSrgbGamma()),
      color: const Color(0xFFFFFFFF),
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(40),
      ),
    ),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
      blendMode: BlendMode.srcIn,
      child: child,
    ),
  );
}
