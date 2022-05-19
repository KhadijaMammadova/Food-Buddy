import 'package:flutter/material.dart';
import 'package:food_buddy/Screens/Homepage/profile_page.dart';
import 'package:food_buddy/Screens/Homepage/restourants_screen.dart';
import 'package:food_buddy/Screens/Welcome/welcome_screen.dart';
import '../../constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../Chat/chat_screen.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}


class _MainPage extends State<MainPage> {
  int _pageIndex = 1;
  GlobalKey _bottomNavigationKey = GlobalKey();

  List pages = [
    MyRoute(
      iconData: Icons.chat,
      page: ChatScreen(),
    ),
    MyRoute(
      iconData: Icons.home,
      page: RestourantsPage(),
      ),
    MyRoute(
      iconData: Icons.person,
      page: ProfilePage(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(34.0), // here the desired height
          child: AppBar(
        elevation: 0,
        title: Text('Food Buddy'),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: TextButton.icon(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()),
                    (route) => false);
              },
              icon: Icon(Icons.logout),
              label: Text('Sign Out'),
              style: TextButton.styleFrom(primary: Colors.white),
            ),
          ),
        ],
      )),
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        key: _bottomNavigationKey,
        height: 50.0,
        backgroundColor: Colors.white,
        color: kPrimaryColor,
        animationCurve: Curves.easeInBack,
        animationDuration: Duration(milliseconds: 300),
        items: pages.map((p) => Icon(p.iconData, size: 22, color: Colors.white,)).toList(),
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
      body: pages[_pageIndex].page,
    ));
  }
}

class MyRoute {
  final IconData iconData;
  final Widget page;

  MyRoute({required this.iconData, required this.page});
}
