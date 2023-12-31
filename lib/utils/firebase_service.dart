import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseService {
  static initializeFirebaseApp() async {
    await Firebase.initializeApp();
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    String? fcmToken = await messaging.getToken();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      var android = const AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        priority: Priority.high,
        importance: Importance.max,
      );

      await flutterLocalNotificationsPlugin.show(
        0,
        message.notification?.title ?? '',
        message.notification?.body ?? '',
        NotificationDetails(android: android),
      );
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print(
            'Message also contained a notification: ${message.notification?.android?.toMap()}');
      }
    });
    print("FCM Token :: $fcmToken");

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }
}
