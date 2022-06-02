// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food_buddy/components/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 233, 233),
      appBar: AppBar(
        title: Text('Food Buddy Canlı Destek'),
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              splashColor: Colors.grey,
              color: kPrimaryColor,
              onPressed: () async => await launch(
                  "https://wa.me/?text=Merhaba. Food Buddy canlı destek."),
              child: Text(
                'Canlı Destek',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(onPressed: () {}, child: Text('foodbuddy.devs@gmail.com', style: TextStyle(color: kPrimaryColor, decoration: TextDecoration.underline)))
          ],
        ),
      ),
    );
  }
}
