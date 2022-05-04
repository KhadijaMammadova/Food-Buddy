import 'package:flutter/material.dart';
import 'package:food_buddy/Screens/Welcome/welcome_screen.dart';
import '../../constants.dart';


class HomePage extends StatelessWidget {
  const HomePage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.only(top: 300, left: 40),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: size.width * 0.8,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: ElevatedButton(
                child: Text(
                  'ÇIKIŞ YAP',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return WelcomeScreen();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    textStyle: TextStyle(
                        color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
              )
          ),
        ),
      ),
    );
  }
}

