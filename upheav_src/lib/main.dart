import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upheav_src/local_database/database_creator.dart';
import 'package:upheav_src/screens/home_screen.dart';
import 'package:upheav_src/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var userName = prefs.getString('userName');
  await DatabaseCreator().initDatabase();
  runApp(MainApp(
    userName: userName,
  ));
}

class MainApp extends StatelessWidget {
  final String userName;

  const MainApp({Key key, this.userName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Ubuntu',
        primaryColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: userName == null ? SplashScreen() : HomeScreen(userName: userName),
    );
  }
}
