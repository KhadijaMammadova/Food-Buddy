import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_buddy/components/constants.dart';

class ConversationPage extends StatelessWidget {
  const ConversationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 233, 233),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        titleSpacing: -5,
        title: Row(children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage("https://placekitten.com/200/200"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text('User13'),
          )
        ]),
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(onTap: () {}, child: Icon(Icons.phone)),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(onTap: () {}, child: Icon(Icons.camera_alt)),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell
            (onTap: () {}, 
            child: Icon(Icons.more_vert)),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Align(
                      alignment: index % 2 == 0 
                      ? Alignment.centerLeft 
                      : Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(10),
                            right: Radius.circular(10),
                          ),
                          color: kPrimaryColor),
                        child: Text('Deneme Mesaji', style: TextStyle(color: Colors.white),))),
                  );
                }),
          ),
          Row(
            children: [Expanded(
              child: Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(25),
                    right: Radius.circular(25),
                    )
                ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Icon(Icons.tag_faces_rounded, color: Colors.grey,),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Type a message",
                      border: InputBorder.none
                      ),
                    ),
                  ),
                  InkWell(
                    child: Icon(Icons.attach_file_rounded, color: Colors.grey,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Icon(Icons.camera_alt_rounded, color: Colors.grey,),
                    ),
                  ),
                ],
              ),
            )
            ),
            Container(
              margin: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor),
              child: IconButton(onPressed: () {}, icon: Icon(Icons.mic, color: Colors.white,))),
            ],
          )
        ],
      ),
    );
  }
}
