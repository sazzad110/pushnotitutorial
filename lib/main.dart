import 'package:flutter/material.dart';
import 'package:pushnotitutorial/pages/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pushnotitutorial/firebase_options.dart';
import 'package:pushnotitutorial/pages/notification_page.dart';

import 'api/firebase_api.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      // navigatorKey: navigatorKey,
      // routes: {
      //   '/notification_page': (context) => NotificationPage(),
      // },
    );
  }
}
