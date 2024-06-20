import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _showNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      '알림테스트',
      '플로팅 버튼 클릭 했습니다.',
      platformChannelSpecifics,
      payload: 'item x',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.auto_awesome_mosaic_outlined),
        onPressed: _showNotification,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
