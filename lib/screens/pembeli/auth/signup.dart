import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:upj_digital_canteen/auth.dart';
import 'package:upj_digital_canteen/constants.dart';
import 'package:upj_digital_canteen/firestore.dart';
import 'package:upj_digital_canteen/screens/pembeli/auth/login.dart';
import 'package:upj_digital_canteen/screens/pembeli/homescreen/homescreen_main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final emailTextFieldController = TextEditingController();
  final nameTextFieldController = TextEditingController();
  final passwordTextFieldController = TextEditingController();
  final confirmPasswordTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 75,
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/upj_logo.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Welcome to UPJ Digital Canteen',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Sign up',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              ),
              _emailTextField(),
              SizedBox(
                height: 25,
              ),
              _nameTextField(),
              SizedBox(
                height: 25,
              ),
              _passwordTextField(),
              SizedBox(height: 25),
              _confirmPasswordTextField(),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _continueButton(context),
                  _goToSignInButton(context),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Material _goToSignInButton(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.pink),
          ),
          height: 50,
          width: 180,
          child: Center(
            child: Text(
              'I want to login',
              style: TextStyle(
                fontSize: 15,
                color: Color(kThemeColor),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Material _continueButton(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () async {
          if (!allFieldsAreFilled()) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Please fill all fields!'),
              ),
            );
            return;
          }

          if (!bothPasswordFieldsMatch()) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Password do not match!'),
              ),
            );
            return;
          }

          try {
            await Auth().createUserWithEmailAndPassword(
              email: emailTextFieldController.text,
              password: passwordTextFieldController.text,
            );

            UserData().addUserToCollection(
              uid: Auth().currentUser!.uid,
              username: nameTextFieldController.text,
            );
          } on FirebaseAuthException catch (e) {
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
              'Continue',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextField _confirmPasswordTextField() {
    return TextField(
      controller: confirmPasswordTextFieldController,
      textAlignVertical: TextAlignVertical.center,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        prefixIcon: Icon(Icons.password),
      ),
    );
  }

  TextField _passwordTextField() {
    return TextField(
      controller: passwordTextFieldController,
      textAlignVertical: TextAlignVertical.center,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        prefixIcon: Icon(Icons.password),
      ),
    );
  }

  TextField _nameTextField() {
    return TextField(
      controller: nameTextFieldController,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        labelText: 'Name',
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        prefixIcon: Icon(Icons.person),
      ),
    );
  }

  TextField _emailTextField() {
    return TextField(
      controller: emailTextFieldController,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        labelText: 'Email',
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        prefixIcon: Icon(Icons.email),
      ),
    );
  }

  bool allFieldsAreFilled() {
    return !(emailTextFieldController.text.isEmpty ||
        nameTextFieldController.text.isEmpty ||
        passwordTextFieldController.text.isEmpty ||
        confirmPasswordTextFieldController.text.isEmpty);
  }

  bool bothPasswordFieldsMatch() {
    return passwordTextFieldController.text ==
        confirmPasswordTextFieldController.text;
  }
}
