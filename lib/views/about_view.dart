import 'package:flutter/material.dart';

class AboutView extends StatefulWidget {
  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ukiyo',
              style: TextStyle(
                  fontFamily: 'Majesty', color: Colors.red, fontSize: 65),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '                by Shahin Sharaf',
              style: TextStyle(
                  fontFamily: 'Nanum',
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
