import 'package:flutter/material.dart';
import 'package:upj_digital_canteen/constants.dart';
import 'package:upj_digital_canteen/homescreen.dart';
import 'utils.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red.shade50,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Color(kThemeColor),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
        ),
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Color(kThemeColor),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => NotifCard(),
      ),
    );
  }
}

class NotifCard extends StatelessWidget {
  const NotifCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 5,
      ),
      child: Container(
        height: 90,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          border: Border(
            left: BorderSide(
              width: 20,
              color: Color(kThemeColor),
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Information name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Text(
                'Tanggal',
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
