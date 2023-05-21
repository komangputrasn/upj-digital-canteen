import 'package:flutter/material.dart';
import 'package:upj_digital_canteen/screens/penjual/settings/settings_main.dart';

class MerchantHomeScreen extends StatelessWidget {
  const MerchantHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MerchantSettingsScreen(),
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.restaurant),
          ),
        ],
      ),
      body: Center(child: Text('This is the home screen!')),
    );
  }
}
