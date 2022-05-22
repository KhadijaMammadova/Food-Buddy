import 'package:flutter/material.dart';
import 'package:food_buddy/Screens/Chat/first_page.dart';
import 'package:food_buddy/Screens/Chat/forth_page.dart';
import 'package:food_buddy/Screens/Chat/second_page.dart';
import 'package:food_buddy/Screens/Chat/third_page.dart';
import 'package:food_buddy/Screens/Homepage/main_page.dart';
import 'package:food_buddy/components/constants.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _showMessage = true;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(() {
      _showMessage = _tabController.index != 0;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text('Chat'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: TextButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                      (route) => false);
                },
                icon: Icon(Icons.logout),
                label: Text('Geri Dön'),
                style: TextButton.styleFrom(primary: Colors.white),
              ),
            ),
          ],
          bottom: TabBar(controller: _tabController, tabs: <Widget>[
            Tab(
              text: 'search',
            ),
            Tab(
              text: 'mesajlar',
            ),
            Tab(
              text: 'DM',
            ),
            Tab(
                icon: Icon(
              Icons.settings,
            )),
          ])),
      body: TabBarView(controller: _tabController, children: <Widget>[
        FirstPage(),
        SecondPage(),
        ThirdPage(),
        ForthPage(),
      ]),
      floatingActionButton: _showMessage
          ? FloatingActionButton(
              backgroundColor: kPrimaryColor,
              child: Icon(
                Icons.message_rounded,
              ),
              onPressed: () {},
            )
          : null,
    );
  }
}
