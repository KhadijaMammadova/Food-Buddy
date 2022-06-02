import 'package:flutter/material.dart';
import 'package:food_buddy/Screens/Chat/camera.dart';
import 'package:food_buddy/Screens/Chat/forth_page.dart';
import 'package:food_buddy/Screens/Chat/mesajlar.dart';
import 'package:food_buddy/Screens/Chat/durumlar.dart';
import 'package:food_buddy/Screens/Homepage/notfound.dart';
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
      _showMessage = _tabController.index != 2;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
              child: Column(
                children: <Widget>[
                  TabBar( controller: _tabController, tabs: <Widget>[
                Tab(
                    text: 'mesajlar',
                ),
                Tab(
                    text: 'durumlar',
                ),
                 Tab(
                      icon: Icon(
                    Icons.camera_alt,
                )),
                Tab(
                      icon: Icon(
                    Icons.settings,
                )),
              ]),
                  Expanded(
                    child: Container(
                      color: Color.fromARGB(255, 240, 233, 233),
                      child: TabBarView(controller: _tabController, children: <Widget>[
                        MesajlarPage(),
                        DurumlarPage(),
                        CameraPage(),
                        ForthPage(),
                      ]),
                    ),
                  ),
                ],
              ), 
      ),
      floatingActionButton: _showMessage
          ? FloatingActionButton(
              backgroundColor: kPrimaryColor,
              child: Icon(
                Icons.search_rounded
              ),
              onPressed: () {
                ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          "Favorilediğiniz restoranlara gidecek olan kişileri buradan bulup iletişime geçebileceksiniz."),
                                      backgroundColor: Colors.grey[600],
                                    ));
                Navigator.push(context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return NotFoundPage();
                                },
                              ),);
              },
            )
          : null,
    );
  }
}
