import 'package:hive/hive.dart';

part 'tasks.g.dart';

@HiveType(typeId: 1)
class Tasks {
  Tasks({
    required this.id,
    required this.heading,
    required this.about,
    required this.date,
    required this.time,
    required this.isDone,
  });
  @HiveField(0)
  int id;

  @HiveField(1)
  String heading;

  @HiveField(2)
  String about;

  @HiveField(3)
  String date;

  @HiveField(4)
  String time;

  @HiveField(5)
  bool isDone;
}
