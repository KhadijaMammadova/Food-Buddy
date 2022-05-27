import 'package:flutter/material.dart';
import 'package:food_buddy/Screens/Chat/camera.dart';
import 'package:food_buddy/Screens/Chat/forth_page.dart';
import 'package:food_buddy/Screens/Chat/mesajlar.dart';
import 'package:food_buddy/Screens/Chat/durumlar.dart';
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
      body: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    floating: true,
                    title: Text('Chat'),
                    backgroundColor: kPrimaryColor,
                    actions: [
                      IconButton(
                        onPressed: () {}, 
                      icon: Icon(Icons.search_rounded)
                      ),
                      IconButton(
                        onPressed: (){}, 
                        icon: Icon(Icons.more_vert)
                        ),
                    ],
                  )
                  ];
              },
              body: Column(
                children: <Widget>[
                  TabBar( controller: _tabController, tabs: <Widget>[
                Tab(
                      icon: Icon(
                    Icons.camera_enhance_rounded,
                )),
                Tab(
                    text: 'mesajlar',
                ),
                Tab(
                    text: 'durumlar',
                ),
                Tab(
                      icon: Icon(
                    Icons.settings,
                )),
              ]),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: TabBarView(controller: _tabController, children: <Widget>[
                        FirstPage(),
                        SecondPage(),
                        ThirdPage(),
                        ForthPage(),
                      ]),
                    ),
                  ),
                ],
              )),
        ),
      ),
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
