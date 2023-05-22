import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:upj_digital_canteen/auth.dart';
import 'package:upj_digital_canteen/constants.dart';
import 'package:upj_digital_canteen/firestore.dart';
import 'package:upj_digital_canteen/screens/pembeli/homescreen/homescreen_main.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameTextFieldController = TextEditingController();
  final emailTextFieldController = TextEditingController();
  final newPasswordTextFieldController = TextEditingController();
  final confirmPasswordTextFieldController = TextEditingController();

  late Future<String> currentUsername;

  @override
  void initState() {
    super.initState();
    emailTextFieldController.text = Auth().currentUser!.email!;
    currentUsername = UserData().getCurrentUsername();
    currentUsername.then((value) {
      nameTextFieldController.text = value;
    });
  }

  bool allFieldsAreFilled() {
    return nameTextFieldController.text.isNotEmpty &&
        emailTextFieldController.text.isNotEmpty &&
        newPasswordTextFieldController.text.isNotEmpty &&
        confirmPasswordTextFieldController.text.isNotEmpty;
  }

  bool bothPasswordFieldsMatch() {
    return newPasswordTextFieldController.text ==
        confirmPasswordTextFieldController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          'Your profile',
          style: TextStyle(
            color: Color(kThemeColor),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              color: Colors.red.shade50,
              child: Column(
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  ProfilePicture(),
                  SizedBox(
                    height: 15,
                  ),
                  FutureBuilder<String>(
                    future: currentUsername,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Text(
                          snapshot.data!,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      } else {
                        return Text(
                          'Your profile',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25),
              child: Wrap(
                runSpacing: 15,
                children: [
                  TextFormField(
                    controller: nameTextFieldController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                  ),
                  TextFormField(
                    controller: emailTextFieldController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                  ),
                  TextFormField(
                    controller: newPasswordTextFieldController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'New password',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                  ),
                  TextFormField(
                    controller: confirmPasswordTextFieldController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm new password',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                  ),
                  SizedBox(
                    height: 120,
                  ),
                  Center(
                    child: Material(
                      child: InkWell(
                        onTap: () async {
                          if (!allFieldsAreFilled()) {
                            showSnackBar(context, 'Please fill all fields!');
                            return;
                          }

                          if (!bothPasswordFieldsMatch()) {
                            showSnackBar(context, 'Password do not match!');
                            return;
                          }

                          try {
                            await Auth().updateUsernamePassword(
                              emailTextFieldController.text,
                              newPasswordTextFieldController.text,
                            );
                          } on FirebaseAuthException catch (e) {
                            showErrorMessage(e);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(kThemeColor),
                          ),
                          height: 50,
                          width: 180,
                          child: Center(
                            child: Text(
                              'Save Changes',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void showErrorMessage(FirebaseAuthException e) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('Error'),
        contentPadding: EdgeInsets.all(20),
        children: [
          Text(e.message!),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      ),
    );
  }
}

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({
    super.key,
  });

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          minRadius: 45,
          backgroundColor: Colors.pink,
        ),
      ],
    );
  }
}
