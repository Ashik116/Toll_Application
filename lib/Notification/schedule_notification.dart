// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class LocalNotification {
//   LocalNotification();
//
//   final _localNotificationservices = FlutterLocalNotificationsPlugin();
//
//   Future<void> intialize() async {
//     const AndroidInitializationSettings androidInitializationsSettings =
//         AndroidInitializationSettings('luncher_iocn');
//
//     const IOSInitializationSettings iosInitializationSettings =
//         IOSInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//       onDidReceiveLocalNotification: onDidReceiveLocalNotification,
//     );
//
//     final InitializationSettings settings = InitializationSettings(
//         androidInitializationsSettings, iosInitializationSettings);
//     await _localNotificationservices.initialize(settings,
//         onSelectNotification: onSelectNotification);
//   }
//
//   Future<NotificationDetails>_notificationDetails() async {
//     const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
//       'channel_id',
//       'channel_name',
//
//     )
//   }
//
//   void onDidReceiveLocalNotification(
//       int id, String title, String body, String payload) {
//     print('id $id');
//   }
//
//   void onSelectNotification(String payload) {
//     print('payload $payload');
//   }
// }
