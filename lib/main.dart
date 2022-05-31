import 'package:flutter/material.dart';
import 'package:food_buddy/Screens/Homepage/main_page.dart';
import 'package:food_buddy/core/services/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_buddy/Screens/Onboarding/onboarding_screen.dart';
import 'package:flutter/services.dart';

int? isViewed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onboard');
  await Firebase.initializeApp();
  setupLocators();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Buddy',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: isViewed != 0 ? OnboardingScreen() : MainPage(),
    );
  }
}
