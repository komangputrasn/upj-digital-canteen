import 'package:flutter/material.dart';
import 'package:upj_digital_canteen/auth.dart';

class MerchantSettingsScreen extends StatelessWidget {
  const MerchantSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Sign out'),
          onPressed: () async {
            await Auth().signOut();
          },
        ),
      ),
    );
  }
}
