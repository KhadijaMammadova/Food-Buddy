import 'package:flutter/material.dart';
import 'package:food_buddy/Screens/Chat/chat.dart';


class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            width: size.width * 0.8,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(29),
          child: ElevatedButton(
                                  child: Text(
                                    'Chat sayfasına geç',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Chat();
                          },
                        ),
                      );}
        ),
    )),
      ));
  }
}
