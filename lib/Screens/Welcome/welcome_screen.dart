import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_buddy/Screens/Login/login_screen.dart';
import 'package:food_buddy/Screens/Signup/signup_screen.dart';
import '../../constants.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_top.png",
                width: size.width * 0.35,
                color: kPrimaryColor,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HOŞ GELDİNİZ",
                    style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
                  ),
                  SizedBox(height: size.height * 0.05),
                  SvgPicture.asset(
                    "assets/icons/chat.svg",
                    height: size.height * 0.45,
                  ),
                  SizedBox(height: size.height * 0.05),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: size.width * 0.8,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        child: ElevatedButton(
                          child: Text(
                            'GİRİŞ YAP',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LoginScreen();
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
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: size.width * 0.8,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        child: ElevatedButton(
                          child: Text(
                            'KAYIT OL',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SignUpScreen();
                                },
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              primary: kPrimaryLightColor,
                              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                              textStyle: TextStyle(
                                  color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
                        )
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/images/login_bottom.png",
                width: size.width * 0.4,
                color: kPrimaryLightColor,
              ),
            ),
          ],
        ),
      )
    );
  }
}
