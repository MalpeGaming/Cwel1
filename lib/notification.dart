import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/material.dart';
//import 'package:flutter_native_timezone/flutter_native_timezone.dart';


class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  // static final NotificationService _instance = NotificationService._internal();

  static Future<void> onDidReceiveBackgroundNotificationResponse(NotificationResponse notificationResponse) async {
    print("Notification receive");
    print(["onDidReceiveNotificationResponse", notificationResponse.actionId]);
  }

  // factory NotificationService() {
  //   return _instance;
  // }

  NotificationService._internal();

  static Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse : onDidReceiveBackgroundNotificationResponse,
      onDidReceiveBackgroundNotificationResponse: onDidReceiveBackgroundNotificationResponse,
    );

    // app_icon needs to be a added as a drawable resource to the
    // Android head project

    tz.initializeTimeZones();
    final String currentTimeZone = DateTime.now().timeZoneName;
    //print("CurrentTimeZone: ${currentTimeZone}");

    //String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    //print("TimeZoneName: ${timeZoneName}");
    tz.setLocalLocation(tz.getLocation("Europe/Warsaw"));
  }

  static Future<void> scheduleDailyNotification(int id, String title, String body, DateTime selectedTime) async {
    if (selectedTime.isBefore(DateTime.now())) {
      print("BEFORE");
      selectedTime = selectedTime.add(const Duration(days: 1));
    }
    final tz.TZDateTime scheduledTime = tz.TZDateTime.from(selectedTime, tz.local);
    print("TIME SCHEDULED: $scheduledTime");
    print("TIME NOW: ${DateTime.now()}");

    try {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        scheduledTime,
        const NotificationDetails(
          iOS: DarwinNotificationDetails(
            interruptionLevel: InterruptionLevel.timeSensitive,
            presentSound: true,
          ),
          android: AndroidNotificationDetails(
            'your_channel_id',
            'your_channel_name',
            //'your_channel_description',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false,
          ),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dateAndTime,
        //matchDateTimeComponents: DateTimeComponents.time,
      );

      print('Notification scheduled successfully');
    } catch (e) {
      print('Error scheduling notification: $e');
    }
  }

  // NotificationDetails _notificationDetails() {
  //   return NotificationDetails(
  //     android: AndroidNotificationDetails(
  //       'your_channel_id',
  //       'your_channel_name',
  //       //'your_channel_description',
  //       importance: Importance.max,
  //       priority: Priority.high,
  //       showWhen: false,
  //     ),
  //     //iOS: IOSNotificationDetails(),
  //     iOS: DarwinNotificationDetails(
  //       interruptionLevel: InterruptionLevel.timeSensitive,
  //       presentSound: true,
  //     ),
  //   );
  // }
}