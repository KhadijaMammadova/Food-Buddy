import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_buddy/Screens/Signup/components/or_divider.dart';
import 'package:food_buddy/Screens/Signup/signup_screen.dart';
import 'package:food_buddy/Service/auth.dart';
import 'package:food_buddy/components/already_have_an_account_acheck.dart';
import '../../Mİsafir_Girish/misafir.dart';
import '../../components/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Homepage/main_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AuthService _authService = AuthService();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 233, 233),
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  SizedBox(height: size.height * 0.03),
                  Image.asset(
                    "assets/icons/girish.png",
                    height: size.height * 0.35,
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: TextField(
                      controller: _emailController,
                      onChanged: (value) {},
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email_rounded,
                          color: Colors.white,
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      onChanged: (value) {},
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        hintText: "Şifre",
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  loading
                      ? CircularProgressIndicator(
                          color: kPrimaryColor,
                        )
                      : Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: size.width * 0.8,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(29),
                              child: ElevatedButton(
                                child: Text(
                                  'GİRİŞ YAP',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () async {
                                  setState(() {
                                    loading = true;
                                  });
                                  if (_emailController.text == "" ||
                                      _passwordController.text == "") {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          "Lütfen bütün boş alanları doldurunuz!"),
                                      backgroundColor: Colors.grey[600],
                                    ));
                                  } else {
                                    User? result = await AuthService().login(
                                        _emailController.text,
                                        _passwordController.text,
                                        context);
                                    if (result != null) {
                                      print('Success');
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MainPage()),
                                          (route) => false);
                                    }
                                  }
                                  setState(() {
                                    loading = false;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 20),
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                              )),
                        ),
                  OrDivider(),
                  AlreadyHaveAnAccountCheck(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpScreen();
                          },
                        ),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                           Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MisafirPage();
                                },
                              ),
                            );
                        },
                        child: Text(
                          "Misafir kullanıcı",
                          style: const TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}
