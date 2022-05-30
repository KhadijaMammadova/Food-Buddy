import 'package:flutter/material.dart';
import 'package:food_buddy/components/constants.dart';

class SorryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Buddy'),
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/2_404 Error.png",
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
