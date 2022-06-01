import 'package:flutter/material.dart';
import 'package:food_buddy/Screens/Login/login_screen.dart';
import 'package:food_buddy/components/already_have_an_account_acheck.dart';
import '../../Mİsafir_Girish/misafir.dart';
import '../../components/constants.dart';
import '../Homepage/main_page.dart';
import 'components/or_divider.dart';
import 'package:food_buddy/Service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreen createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //final TextEditingController _confirmPasswordController = TextEditingController();
  AuthService _authService = AuthService();
  bool loading = false;

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
                  Image.asset(
                    "assets/icons/signup.png",
                    height: size.height * 0.35,
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
                      controller: _nameController,
                      onChanged: (value) {},
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        hintText: "Kullanıcı Adı",
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
                      ? CircularProgressIndicator(color: kPrimaryColor,)
                      : Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: size.width * 0.8,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(29),
                            child: ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  loading = true;
                                });
                                if (_emailController.text == "" ||
                                    _passwordController.text == "" ||
                                    _nameController.text == "") {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        "Lütfen bütün boş alanları doldurunuz!"),
                                    backgroundColor: Colors.grey[600],
                                  ));
                                  /*} else if (_passwordController.text !=
                                _confirmPasswordController.text) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Şifreler uyumlu değil"),
                                backgroundColor: Colors.grey[600],
                              ));*/
                                } else {
                                  User? result = await AuthService().register(
                                      _emailController.text,
                                      _passwordController.text,
                                      _nameController.text,
                                      context);
                                  if (result != null) {
                                    print('Success');
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainPage()), (route) => false);
                                  }
                                }
                                setState(() {
                                  loading = false;
                                });
                              },
                              child: Text(
                                'KAYDET',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 20),
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ),
                          )),
                  OrDivider(),
                  AlreadyHaveAnAccountCheck(
                    login: false,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
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
