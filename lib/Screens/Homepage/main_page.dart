import 'package:flutter/material.dart';
import 'package:food_buddy/Screens/Homepage/profile_page.dart';
import 'package:food_buddy/Screens/Homepage/homepage_restourants_screen.dart';
import 'package:food_buddy/Screens/Welcome/welcome_screen.dart';
import '../../components/constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../Chat/chat_screen.dart';
import '../NavBar/navbar.dart';

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
      page: Chat(),
    ),
    MyRoute(
      iconData: Icons.home,
      page: HomePage(),
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
          drawer: NavBar(),
          body: Container(
              child: Container(
            color: kPrimaryColor,
            child: SafeArea(
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      floating: true,
                      snap: true,
                      elevation: 0,
                      title: Text('Food Buddy'),
                      //centerTitle: true,
                      backgroundColor: kPrimaryColor,
                      foregroundColor: Colors.white,
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: TextButton.icon(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WelcomeScreen()),
                                  (route) => false);
                            },
                            icon: Icon(Icons.logout),
                            label: Text('Çıkış Yap'),
                            style: TextButton.styleFrom(primary: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ];
                },
                body: pages[_pageIndex].page,
              ),
            ),
          )),
          bottomNavigationBar: CurvedNavigationBar(
            index: 1,
            key: _bottomNavigationKey,
            height: 49.0,
            backgroundColor: Color.fromARGB(255, 240, 233, 233),
            color: kPrimaryColor,
            animationCurve: Curves.easeInCubic,
            animationDuration: Duration(milliseconds: 300),
            items: pages
                .map((p) => Icon(
                      p.iconData,
                      size: 20,
                      color: Colors.white,
                    ))
                .toList(),
            onTap: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
          ),
        ));
  }
}

class MyRoute {
  final IconData iconData;
  final Widget page;

  MyRoute({required this.iconData, required this.page});
}
