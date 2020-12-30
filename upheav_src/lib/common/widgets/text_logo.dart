import 'package:flutter/material.dart';

class TextBio extends StatelessWidget {
  const TextBio({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          "Welcome to UpHeav, your very own personal journal.\n Start by writting your first journal. Let's get you started.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
