import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:upj_digital_canteen/history.dart';
import 'package:upj_digital_canteen/profile.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/upj_logo.png'),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'UPJ Digital Canteen',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          DrawerMenu(
            icon: Icon(Icons.history),
            menuName: 'History',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => History(),
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          DrawerMenu(
            icon: Icon(Icons.person),
            menuName: 'Profile',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          DrawerMenu(
            icon: Icon(Icons.logout),
            menuName: 'Log out',
            onTap: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
          SizedBox(
            height: 10,
          ),
          DrawerMenu(
            icon: Icon(Icons.info),
            menuName: 'About us',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    super.key,
    required this.icon,
    required this.menuName,
    this.onTap,
  });

  final Icon icon;
  final String menuName;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 300,
          height: 50,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                icon,
                SizedBox(
                  width: 20,
                ),
                Text(
                  menuName,
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
