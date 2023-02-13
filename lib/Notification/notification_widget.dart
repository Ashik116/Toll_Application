// import 'dart:async';
//
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationWidget {
//   static final _notification = FlutterLocalNotificationsPlugin();
//
//   static Time get notificationTime => Time(7, 0, 0);
//   static Time get notificationTimee => Time(8, 0, 0);
//   static Time get notificationTimea => Time(19, 0, 0);
//   static Time get notificationTimeb => Time(20, 0, 0);
//   // var time = DateTime.now().hour.toString();
//
//   static Future init({bool scheduled = true}) async {
//     var initAndroidSettings =
//         AndroidInitializationSettings('@mipmap/launcher_icon');
//     var ios = IOSInitializationSettings();
//     final settings = InitializationSettings(
//       initAndroidSettings,
//       ios,
//     );
//     await _notification.initialize(settings);
//   }
//
//   static Future<void> showNotification({
//     var id = 0,
//     var title,
//     var body,
//     var payload,
//   }) async {
//     var time = DateTime.now().add(Duration(seconds: 25));
//     return _notification.showDailyAtTime(
//         id, title, body, notificationTime, notificationDetails());
//   }
//
//   static Future<void> schedulleshowNotification({
//     var id = 0,
//     var title,
//     var body,
//     var payload,
//   }) async {
//     var time = DateTime.now().add(Duration(seconds: 25));
//     return _notification.showDailyAtTime(
//         id, title, body, notificationTime, notificationDetails());
//   }
//
//   static notificationDetails() {
//     return NotificationDetails(
//       android: AndroidNotificationDetails(
//         'channel id',
//         'channel name',
//         'channel description',
//         playSound: true,
//       ),
//       iOS: IOSNotificationDetails(),
//     );
//   }
//
//   static Future<void> asshowNotification({
//     var id = 0,
//     var title,
//     var body,
//     var payload,
//   }) async {
//     var time = DateTime.now().add(Duration(seconds: 35));
//     return _notification.showDailyAtTime(
//         id, title, body, notificationTimee, notificationDetails());
//   }
//
//   static Future<void> eighthowNotification({
//     var id = 0,
//     var title,
//     var body,
//     var payload,
//   }) async {
//     var time = DateTime.now().add(Duration(seconds: 45));
//     return _notification.showDailyAtTime(
//         id, title, body, notificationTimea, notificationDetails());
//   }
//
//   static Future<void> ninhowNotification({
//     var id = 0,
//     var title,
//     var body,
//     var payload,
//   }) async {
//     var time = DateTime.now().add(Duration(seconds: 55));
//     return _notification.showDailyAtTime(
//         id, title, body, notificationTimeb, notificationDetails());
//   }
//
//   static Future<void> vshowNotification({
//     var id = 0,
//     var title,
//     var body,
//     var payload,
//   }) async {
//     var time = DateTime.now().add(Duration(seconds: 25));
//     return _notification.show(id, title, body, notificationDetails());
//   }
// }
