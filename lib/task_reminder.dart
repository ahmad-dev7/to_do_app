import 'package:awesome_notifications/awesome_notifications.dart';

class TaskReminder {
  static init() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelGroupKey: 'remindTaskGroup',
          channelKey: 'remindTask',
          channelName: 'Task Reminder',
          channelDescription: 'This channel reminds the due task',
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          playSound: true,
          criticalAlerts: true,
        ),
      ],
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'remindTaskGroup',
          channelGroupName: 'Task reminder group',
        )
      ],
      debug: true,
    );
    bool isNotificationAllowed =
        await AwesomeNotifications().isNotificationAllowed();
    if (!isNotificationAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }

    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: TaskReminder.onActionReceivedMethod,
      onNotificationCreatedMethod: TaskReminder.onNotificationCreatedMethod,
      onDismissActionReceivedMethod: TaskReminder.onActionReceivedMethod,
      onNotificationDisplayedMethod: TaskReminder.onNotificationDisplayedMethod,
    );
  }

  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
  }
}
