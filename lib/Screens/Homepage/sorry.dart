// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SorryPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Buddy'),
        backgroundColor: Color.fromARGB(255, 247, 191, 107),
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/6_Error (1).png",
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
