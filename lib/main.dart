import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do/Services/network/quote_services.dart';
import 'package:to_do/Services/task_services.dart';
import 'package:to_do/pages/animated_splash_screen.dart';
import 'package:to_do/model/tasks.dart';
import 'package:to_do/task_reminder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TaskReminder.init();
  await Hive.initFlutter();
  Hive.registerAdapter(TasksAdapter());
  taskBox = await Hive.openBox('taskBox');
  taskCount = await Hive.openBox('taskCount');
  userInfo = await Hive.openBox('userInfo');
  await QuoteServices.fetchQuote();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do app',
      home: AnimatedSplashScreen(),
    );
  }
}
