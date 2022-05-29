import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_buddy/components/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ConversationPage extends StatefulWidget {
  final String userId;
  final String conversationId;
  const ConversationPage(
      {Key? key, required this.userId, required this.conversationId})
      : super(key: key);

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  final TextEditingController _editingController = TextEditingController();
  late CollectionReference _ref;

  @override
  void initState() {
    _ref = FirebaseFirestore.instance
        .collection('conversation/${widget.conversationId}/messages');
    super.initState();
  }

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
            child: InkWell(onTap: () {}, child: Icon(Icons.more_vert)),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
                stream: _ref.orderBy('timeStamp').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  return !snapshot.hasData
                      ? Center(child: CircularProgressIndicator())
                      : ListView(
                          children: snapshot.data!.docs
                              .map((document) => ListTile(
                                    title: Align(
                                        alignment: widget.userId !=
                                                document['senderId']
                                            ? Alignment.centerLeft
                                            : Alignment.centerRight,
                                        child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                  left: Radius.circular(10),
                                                  right: Radius.circular(10),
                                                ),
                                                color: kPrimaryColor),
                                            child: Text(
                                              document['message'],
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ))),
                                  ))
                              .toList(),
                        );
                }),
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(25),
                      right: Radius.circular(25),
                    )),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: Icon(
                          Icons.tag_faces_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _editingController,
                        decoration: InputDecoration(
                            hintText: "Type a message",
                            border: InputBorder.none),
                      ),
                    ),
                    InkWell(
                      child: Icon(
                        Icons.attach_file_rounded,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
              Container(
                  margin: EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: kPrimaryColor),
                  child: IconButton(
                      onPressed: () async {
                        await _ref.add({
                          'senderId': widget.userId,
                          'message': _editingController.text,
                          'timeStamp': DateTime.now()
                        });
                        _editingController.text = '';
                      },
                      icon: Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                      ))),
            ],
          )
        ],
      ),
    );
  }
}
