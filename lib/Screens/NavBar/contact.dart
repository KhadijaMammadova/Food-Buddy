// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food_buddy/components/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 233, 233),
      appBar: AppBar(
        title: Text('Food Buddy Canlı Destek'),
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Text(
                  "Food Buddy ekibi 7/24 sizinle! Food Buddy ekibi olarak kullanıcı deneyimini iyileştirmek için elimizden geleni yapıyoruz ve daima sorularınızı yanıtlamaya hazırız. Aşağıdaki butona tıklayarak bize ulaşıp canlı destek alabilir, uygulamamız hakkında sorularınızı sorabilir veya şikayet ve önerilerinizi aşağıdaki mail adresine iletebilirsiniz.",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
            RaisedButton(
              splashColor: Colors.grey,
              color: kPrimaryColor,
              onPressed: () async => await launch(
                  "https://wa.me/${905528528098}?text=Merhaba. Food Buddy canlı destek."),
              child: Text(
                'Canlı Destek',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
                onPressed: () {},
                child: Text('foodbuddy.devs@gmail.com',
                    style: TextStyle(
                        color: kPrimaryColor,
                        decoration: TextDecoration.underline)))
          ],
        ),
      ),
    );
  }
}
