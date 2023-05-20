import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:upj_digital_canteen/constants.dart';
import 'package:upj_digital_canteen/screens/pembeli/homescreen/homescreen_main.dart';
import 'package:upj_digital_canteen/signup.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 75,
            ),
            Center(
              child: LoginScreenDecorator(),
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              'Login',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            emailTextField(),
            SizedBox(
              height: 30,
            ),
            passwordTextField(),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
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

                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailTextEditingController.text,
                          password: passwordTextEditingController.text,
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
                        // print(e.message);
                      }

                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => HomeScreen(),
                      //   ),
                      // );
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
                ),
                Material(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SignupPage(),
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
                          'I want to sign up',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(kThemeColor),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  TextField passwordTextField() {
    return TextField(
      controller: passwordTextEditingController,
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

  TextField emailTextField() {
    return TextField(
      controller: emailTextEditingController,
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
    return emailTextEditingController.text.isNotEmpty &&
        passwordTextEditingController.text.isNotEmpty;
  }
}

class LoginScreenDecorator extends StatelessWidget {
  const LoginScreenDecorator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class SignupButton extends StatelessWidget {
  const SignupButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SignupPage(),
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
              'I want to sign up',
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
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
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
}
