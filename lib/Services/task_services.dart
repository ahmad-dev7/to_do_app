import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do/model/tasks.dart';

late Box taskBox;
late Box taskCount;
late Box userInfo;

class TaskServices {
  //? addTask
  Future<void> addTask({required Tasks task, required bool isEdit}) async {
    isEdit ? null : taskCount.add('+');
    taskBox.put(task.id, task);
    return;
  }

  //? getTask
  List<Tasks> getTask(String date) {
    List<Tasks> taskList = [];
    for (Tasks task in taskBox.values) {
      if (task.date == date) {
        taskList.add(task);
      }
    }
    return taskList;
  }

  //* completeTask
  Future<void> completeTask(Tasks task) async {
    task.isDone = true;
    taskBox.put(task.id, task);
  }

  //! deleteTask
  Future<void> deleteTask(int id) async {
    await taskBox.delete(id);
    return;
  }
}
