// import 'package:Probulon/main.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class DemoNotification extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Notification Button'),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               sendNotification();
//             },
//             child: Text('Send Notification'),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> sendNotification() async {
//     var android = AndroidNotificationDetails(
//       'channel_id',
//       'channel_name',
//       priority: Priority.high,
//       importance: Importance.max,
//       largeIcon: DrawableResourceAndroidBitmap('custom_logo'),
//     );
//
//     var platform = NotificationDetails(
//       android: android,
//     );
//
//     await flutterLocalNotificationsPlugin.show(
//       10,
//       'Notification ProbulonTezst',
//       'Notification Body',
//       platform,
//     );
//   }
// }
