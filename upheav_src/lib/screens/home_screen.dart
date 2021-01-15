import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upheav_src/local_database/user_service_repository.dart';
import 'package:upheav_src/models/user_model.dart';
import 'package:upheav_src/screens/rate_your_mood_screen.dart';
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
      appBar: AppBar(
        backgroundColor: Color(0xFF949cdf),
        elevation: 0.0,
      ),
      backgroundColor: Color(0xFF949cdf),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/logo-light.png',
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    'UpHeav',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xFF949cdf),
              ),
            ),
            ListTile(
              title: Text('Sign Out'),
              leading: Icon(Icons.logout),
              onTap: logoutUser,
            ),
            ListTile(
              title: Text('Read Data'),
              onTap: readData,
              leading: Icon(Icons.read_more),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => RateYourMoodScreen(),
            ),
          );
        },
        label: Text('Create Journal'),
        icon: Icon(Icons.create),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          // alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 40.0,
                      top: 16,
                    ),
                    child: Text(
                      "Welcome ${widget.userName}",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 40.0,
                      top: 16,
                      right: 40,
                    ),
                    child: Text(
                      "Here you'll find the list of journals you wrote",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 600,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.create,
                        size: 70,
                        color: Colors.white.withOpacity(0.4),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 40.0,
                          top: 16,
                          right: 40,
                        ),
                        child: Text(
                          "You have not written any journals yet, Write your first journal today!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
