import 'dart:io';

import 'package:flutter/material.dart';
import 'package:upj_digital_canteen/constants.dart';
import 'package:upj_digital_canteen/homescreen.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                  Text(
                    'Nabiel Fauzan',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25),
              child: Wrap(
                runSpacing: 15,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                    initialValue: 'Nabiel Fauzan',
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                    initialValue: 'nabielfauzan@gmail.com',
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Old password',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'New password',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm new password',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                  ),
                  Center(
                    child: Material(
                      child: InkWell(
                        onTap: () {},
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
}

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({
    super.key,
  });

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  XFile? imageFile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          minRadius: 45,
          backgroundColor: Colors.pink,
        ),
        Positioned(
          top: 55,
          left: 220,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            width: 35,
            height: 35,
            child: IconButton(
              icon: Icon(Icons.edit),
              onPressed: _getFromGallery,
            ),
          ),
        ),
      ],
    );
  }

  Future _getFromGallery() async {
    print('test');

    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        imageFile = XFile(pickedFile.path);
      });
    }
  }
}
