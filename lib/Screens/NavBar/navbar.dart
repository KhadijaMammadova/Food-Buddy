import 'package:flutter/material.dart';
import 'package:food_buddy/components/constants.dart';
import 'feedback.dart';
import 'package:food_buddy/Screens/NavBar/contact.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 240, 233, 233),
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('İsim Soyisim'),
            accountEmail: Text('kullanıcımaili@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.grey,
              child: ClipOval(
                child: Image.network(
                  'https://placekitten.com/200/200',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.account_box_rounded,
              color: kPrimaryColor,
            ),
            title: Text(
              'Bize ulaş',
              style: TextStyle(color: kPrimaryColor),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ContactPage();
                  },
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.description,
              color: kPrimaryColor,
            ),
            title: Text(
              'Geri bildirim',
              style: TextStyle(color: kPrimaryColor),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return FeedbackPage();
                  },
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'Kapat',
              style: TextStyle(color: kPrimaryColor),
            ),
            leading: Icon(
              Icons.exit_to_app,
              color: kPrimaryColor,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
