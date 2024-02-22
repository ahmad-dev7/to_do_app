// ignore_for_file: library_private_types_in_public_api, prefer_typing_uninitialized_variables, prefer_generic_function_type_aliases

import 'package:animated_horizontal_calendar/utils/calender_utils.dart';
import 'package:animated_horizontal_calendar/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

typedef OnDateSelected(date);

class HorizontalCalendar extends StatefulWidget {
  final DateTime date;
  final DateTime? initialDate;
  final DateTime? lastDate;
  final Color? textColor;
  final Color? colorOfWeek;
  final Color? colorOfMonth;
  final double? fontSizeOfWeek;
  final FontWeight? fontWeightWeek;
  final double? fontSizeOfMonth;
  final FontWeight? fontWeightMonth;
  final Color? backgroundColor;
  final Color? selectedColor;
  final int? duration;
  final Curve? curve;
  final BoxShadow? selectedBoxShadow;
  final BoxShadow? unSelectedBoxShadow;
  final OnDateSelected? onDateSelected;
  final Widget? tableCalenderIcon;
  final Color? tableCalenderButtonColor;
  final ThemeData? tableCalenderThemeData;

  const HorizontalCalendar({
    Key? key,
    required this.date,
    this.tableCalenderIcon,
    this.initialDate,
    this.lastDate,
    this.textColor,
    this.curve,
    this.tableCalenderThemeData,
    this.selectedBoxShadow,
    this.unSelectedBoxShadow,
    this.duration,
    this.tableCalenderButtonColor,
    this.colorOfMonth,
    this.colorOfWeek,
    this.fontSizeOfWeek,
    this.fontWeightWeek,
    this.fontSizeOfMonth,
    this.fontWeightMonth,
    this.backgroundColor,
    this.selectedColor,
    @required this.onDateSelected,
  }) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<HorizontalCalendar> {
  DateTime? _startDate;
  var selectedCalenderDate;
  final ScrollController _scrollController = ScrollController();

  calenderAnimation() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(seconds: widget.duration ?? 2),
      curve: widget.curve ?? Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    super.initState();
    selectedCalenderDate = widget.date;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    DateTime findFirstDateOfTheWeek(DateTime dateTime) {
      if (dateTime.weekday == 7) {
        if (_scrollController.hasClients) {
          calenderAnimation();
        }
        return dateTime;
      } else {
        if (dateTime.weekday == 1 || dateTime.weekday == 2) {
          if (_scrollController.hasClients) {
            calenderAnimation();
          }
        }
        return dateTime.subtract(Duration(days: dateTime.weekday));
      }
    }

    _startDate = findFirstDateOfTheWeek(selectedCalenderDate);

    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      reverse: true,
      child: Row(
        children: <Widget>[
          const SizedBox(
            width: 10,
          ),
          ListView.builder(
            itemCount: 7,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              DateTime? date0 = _startDate?.add(Duration(days: index));
              int? diffDays = date0?.difference(selectedCalenderDate).inDays;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                padding: const EdgeInsets.only(bottom: 5),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                width: width / 7,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(5, 5),
                      color: diffDays == 0
                          ? const Color(0xFF0C0C0C)
                          : Colors.transparent,
                      blurRadius: 10,
                      spreadRadius: -1,
                    ),
                    BoxShadow(
                      offset: const Offset(-5, -5),
                      color: diffDays == 0
                          ? const Color(0xFF343A3C)
                          : Colors.transparent,
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    widget.onDateSelected!(Utils.getDate(date0));
                    setState(() {
                      selectedCalenderDate =
                          _startDate?.add(Duration(days: index));
                      _startDate = _startDate?.add(Duration(days: index));
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: AnimatedContainer(
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          height: double.maxFinite,
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            color: diffDays != 0
                                ? widget.backgroundColor ?? Colors.transparent
                                : widget.selectedColor ??
                                    const Color(0xF1FFFFFF),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.5),
                                width: 0.1),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                          child: Text(
                            Utils.getDayOfWeek(date0!),
                            style: TextStyle(
                                color: diffDays != 0
                                    ? widget.colorOfMonth ??
                                        Colors.grey.shade700
                                    : Colors.black,
                                fontSize: widget.fontSizeOfWeek ?? 13.0,
                                fontWeight:
                                    widget.fontWeightWeek ?? FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Expanded(
                        flex: 1,
                        child: AnimatedContainer(
                          alignment: Alignment.center,
                          height: double.maxFinite,
                          width: double.maxFinite,
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            color: diffDays != 0
                                ? widget.backgroundColor ?? Colors.transparent
                                : widget.selectedColor ??
                                    const Color(0xFF2B3032),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.5),
                                width: 0.1),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                          ),
                          child: Text(
                            Utils.getDayOfMonth(date0),
                            style: TextStyle(
                              color: diffDays != 0
                                  ? widget.colorOfMonth ?? Colors.grey.shade600
                                  : Colors.white,
                              fontSize: widget.fontSizeOfMonth ?? 13,
                              fontWeight:
                                  widget.fontWeightMonth ?? FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () async {
                DateTime? date = await selectDate();
                widget.onDateSelected!(Utils.getDate(date!));
                setState(() => selectedCalenderDate = date);
              },
              child: Container(
                height: double.infinity,
                width: (width - 10) * 0.1428,
                decoration: BoxDecoration(
                    color: widget.tableCalenderButtonColor ??
                        const Color(0xFF2B3032),
                    border: Border.all(color: grey, width: 1),
                    borderRadius: BorderRadius.circular(8.0)),
                child: widget.tableCalenderIcon ??
                    const Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
    );
  }

  Future<DateTime?> selectDate() async {
    return await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      initialDate: selectedCalenderDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: widget.tableCalenderThemeData ??
              ThemeData.light().copyWith(
                primaryColor: secondaryColor,
                buttonTheme:
                    const ButtonThemeData(textTheme: ButtonTextTheme.primary),
                colorScheme: ColorScheme.light(primary: secondaryColor)
                    .copyWith(secondary: secondaryColor),
              ),
          child: child ?? const SizedBox(),
        ).animate().fade();
      },
      firstDate: widget.initialDate ??
          DateTime.now().subtract(const Duration(days: 30)),
      lastDate: widget.lastDate ?? DateTime.now().add(const Duration(days: 30)),
    );
  }
}
