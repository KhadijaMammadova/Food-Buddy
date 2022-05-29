import 'package:flutter/material.dart';
import 'package:food_buddy/components/constants.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({Key? key}) : super(key: key);

  get kPrimaryColor => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/2_404 Error.png",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
