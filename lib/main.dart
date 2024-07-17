import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uppaineis/routes.dart';
import 'package:uppaineis/screens/home_page.dart';
import 'package:uppaineis/screens/login_page_3/login_page_3_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize('0a5ebe0f-2966-43cc-ad9b-7978f0c7098c');
  OneSignal.Notifications.requestPermission(true);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString('userId');

    if (userId != null) {
      setState(() {
        _isLoggedIn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UP Painéis',
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: _isLoggedIn ? HomePage() : LoginPage3Screen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
