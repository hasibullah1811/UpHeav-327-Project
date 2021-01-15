import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upheav_src/common/utils/colors.dart';
import 'package:upheav_src/common/utils/components.dart';

class DescribeYourDayScreen extends StatefulWidget {
  @override
  _DescribeYourDayScreenState createState() => _DescribeYourDayScreenState();
}

class _DescribeYourDayScreenState extends State<DescribeYourDayScreen> {
  TextEditingController _titleEditingController = TextEditingController();
  TextEditingController _descriptionEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff312c51),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BuildAppBar(
              title: "",
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Text(
                  "Write in your own words",
                  style: TextStyle(
                    color: Colors.white,
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
                  top: 40,
                ),
                child: Text(
                  "Title",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.3),
                    fontSize: 34,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 32.0, right: 32.0, top: 16, bottom: 32),
              child: Container(
                height: 54,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ThemeColors.primaryColor,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  color: Colors.blue.withOpacity(0.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: TextFormField(
                    // focusNode: _focus,
                    controller: _titleEditingController,
                    // onChanged: (value) {
                    //   _updateAnimationStore.validateNickNameField(value);
                    // },
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'eg. Wonderful day at the park',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[200],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                ),
                child: Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.3),
                    fontSize: 34,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 32.0, right: 32.0, top: 16, bottom: 32),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ThemeColors.primaryColor,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  color: Colors.blue.withOpacity(0.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: TextFormField(
                    maxLines: 50,
                    // focusNode: _focus,
                    controller: _descriptionEditingController,
                    // onChanged: (value) {
                    //   _updateAnimationStore.validateNickNameField(value);
                    // },
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'eg. Wonderful day at the park',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[200],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     CupertinoPageRoute(
                //         builder: (context) => DescribeYourDayScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 220.0,
                  left: 16,
                  right: 16.0,
                ),
                child: Container(
                  child: Center(
                    child: Text(
                      "Finish",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
