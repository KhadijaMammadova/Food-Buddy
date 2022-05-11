import 'package:flutter/material.dart';
import 'package:food_buddy/Screens/Welcome/welcome_screen.dart';
import '../../constants.dart';


class HomePage extends StatelessWidget {
  const HomePage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        actions: [
          TextButton.icon(onPressed: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => WelcomeScreen()), (route) => false);
          }, 
          icon: Icon(Icons.logout), 
          label: Text('Sign Out'), 
          style: TextButton.styleFrom(
            primary: Colors.white
            ),
            ),
        ],
      ),
    );
  }
}

