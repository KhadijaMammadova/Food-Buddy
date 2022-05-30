import 'package:flutter/material.dart';
import 'package:food_buddy/Screens/Homepage/homepage_restourants_screen.dart';
import 'package:food_buddy/Screens/Welcome/welcome_screen.dart';
import '../../components/constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../Screens/Signup/signup_screen.dart';


class MisafirPage extends StatefulWidget {
  @override
  _MisafirPage createState() => _MisafirPage();
}

class _MisafirPage extends State<MisafirPage> {
  int _pageIndex = 1;
  GlobalKey _bottomNavigationKey = GlobalKey();

  List pages = [
    MyRoute(
      iconData: Icons.chat,
      page: MisafirProfileAndChatPage(),
    ),
    MyRoute(
      iconData: Icons.home,
      page: HomePage(),
    ),
    MyRoute(
      iconData: Icons.person,
      page: MisafirProfileAndChatPage(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        top: false,
        child: Scaffold(
          body: Container(
            child: Container(
              color: kPrimaryColor,
              child: SafeArea(
                child: NestedScrollView(headerSliverBuilder:
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
                        }, body: pages[_pageIndex].page,
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


class MisafirProfileAndChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 233, 233),
      body: Center(
        child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Bu sayfaya erişebilmek için " ,
          style: const TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: () {
                           Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SignUpScreen();
                                },
                              ),
                            );
                        },
          child: Text(
            "Hesap Oluşturun",
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
        ),
      ),
    );
  }
}
