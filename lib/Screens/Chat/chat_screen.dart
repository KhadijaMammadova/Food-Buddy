import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';


class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Chat'));
  }
}
/*class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  get kPrimaryColor => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          child: Text('Continue'),
          onPressed: () {
            //inal State<StatefulWidget>? navState =
                //NavbarKey.getKey().currentState;
                //navState.setPage(0);
          },
        ),
      ),
      child: TextButton.icon(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => RestourantsPage()),
                  (route) => false);
            },
            icon: Icon(Icons.logout),
            label: Text('Go Back'),
            style: TextButton.styleFrom(primary: kPrimaryColor),
          ),
          ),
    );
  }
}*/
