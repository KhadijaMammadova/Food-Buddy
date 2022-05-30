import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_buddy/Screens/Login/login_screen.dart';
import 'package:food_buddy/Screens/Signup/signup_screen.dart';
import '../../components/constants.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 233, 233),
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[           
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HOŞ GELDİNİZ",
                    style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
                  ),
                  //SizedBox(height: size.height * 0.05),
                  Image.asset(
                    "assets/icons/welcome.png",
                    height: size.height * 0.45,
                  ),
                  //SizedBox(height: size.height * 0.05),
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
                              primary: kPrimaryColor,
                              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                              textStyle: TextStyle(
                                  color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
                        )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
