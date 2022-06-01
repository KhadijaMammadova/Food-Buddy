import 'package:flutter/material.dart';
import 'package:food_buddy/components/constants.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex:3,
                child:Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15.0,),
                      CircleAvatar(
                        radius: 65.0,
                        backgroundImage: NetworkImage("https://placekitten.com/200/200"),
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(height: 10.0,),
                      Text('Kullanıcı İsmi',
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 20.0,
                      )),
                      SizedBox(height: 10.0,),
                      Text('Yaş',
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 15.0,
                      ),)
                  ]
                  ),
                ),
              ),

              Expanded(
                flex:5,
                child: Container(
                  color: Color.fromARGB(255, 240, 233, 233),
                  child: Center(
                      child:Card(
                          margin: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                        child: Container(
                          width: 310.0,
                          height:290.0,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Hakkımda",
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w800,
                                ),),
                                Divider(color: Colors.grey[300],),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.home,
                                      color: Colors.blueAccent[400],
                                      size: 35,
                                    ),
                                    SizedBox(width: 20.0,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Favori Restoranlarım",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),),
                                        Text("Restoran ismi",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey[400],
                                          ),)
                                      ],
                                    )

                                  ],
                                ),
                                SizedBox(height: 20.0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.auto_awesome,
                                      color: Colors.yellowAccent[400],
                                      size: 35,
                                    ),
                                    SizedBox(width: 20.0,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Sevdiğim Yemekler",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),),
                                        Text("Yemek ismi",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey[400],
                                          ),)
                                      ],
                                    )

                                  ],
                                ),
                                SizedBox(height: 20.0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.pinkAccent[400],
                                      size: 35,
                                    ),
                                    SizedBox(width: 20.0,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Hobilerim",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),),
                                        Text("Hobi ismi",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey[400],
                                          ),)
                                      ],
                                    )

                                  ],
                                ),
                                SizedBox(height: 20.0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.people,
                                      color: Colors.lightGreen[400],
                                      size: 35,
                                    ),
                                    SizedBox(width: 20.0,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Takipçiler",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),),
                                        Text("39",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey[400],
                                          ),)
                                      ],
                                    )

                                  ],
                                ),
                              ],
                            ),
                          )
                        )
                      )
                    ),
                  ),
              ),

            ],
          ),
        ],

      ),
    );
  }
}
