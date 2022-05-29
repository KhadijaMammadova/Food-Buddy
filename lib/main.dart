import 'package:flutter/material.dart';
import 'package:food_buddy/Screens/Welcome/welcome_screen.dart';
import 'package:food_buddy/Service/auth.dart';
import 'package:food_buddy/core/services/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/Homepage/main_page.dart';
import 'Screens/Homepage/homepage_restourants_screen.dart';
import 'components/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_buddy/Screens/Onboarding/onboarding_screen.dart';

int? isViewed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onboard');
  await Firebase.initializeApp();
  setupLocators();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Buddy',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      /*home: StreamBuilder(
        stream: AuthService().firebaseAuth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MainPage();
          }
          return WelcomeScreen();
        },
      ),*/
      home: isViewed != 0 ? OnboardingScreen() : MainPage(),
    );
  }
}
