import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upheav_src/local_database/user_service_repository.dart';
import 'package:upheav_src/models/user_model.dart';
import 'package:upheav_src/screens/splash_screen.dart';

class HomeScreen extends StatefulWidget {
  final String userName;

  const HomeScreen({Key key, this.userName}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int id = 0;

  @override
  void initState() {
    super.initState();
  }

  void readData() async {
    final user = await UserServiceRepository.getUser(id);
    print(user.name);

    final allusers = await UserServiceRepository.getAllUsers();
    allusers.forEach((element) {
      print(element.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Welcome, ${widget.userName}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: RaisedButton(
                  onPressed: logoutUser,
                  child: Text('Logout'),
                ),
              ),
              Center(
                child: RaisedButton(
                  onPressed: readData,
                  child: Text('read_data'),
                ),
              ),
              Center(
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('Mood Check'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildItem(UserModel user) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'name: ${user.name}',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs?.clear();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => SplashScreen(),
      ),
      ModalRoute.withName('/'),
    );
  }
}
