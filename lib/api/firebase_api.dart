import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:pushnotitutorial/main.dart';

class FirebaseApi {
  // create and instance of firebase messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  // func to initialize notifications
  Future<void> initNotifications() async {
    // request permission from user ( will prompt user)
    await _firebaseMessaging.requestPermission();

    // fetch the FCM token for this device
    final fCMToken = await _firebaseMessaging.getToken();

    // print the token( normally send it to your server)
    print("token: $fCMToken");

    // initialize further setting for push noti
    initNotifications();
  }

  // function to handle received messages
  void handleMessage(RemoteMessage? message) {
    // if the msg is null do nothing
    if (message == null) return;

    // navigate to new screen when msg is rcved and user taps notification
    navigatorKey.currentState?.pushNamed(
      '/notification_page',
      arguments: message,
    );
  }

  // fucntion to initialize background setting
  Future initPushNotification() async {
    // handle notification if the app was terminated and now opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    //attach event listenesr for when a notifiation opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
