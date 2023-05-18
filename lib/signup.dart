import 'package:flutter/material.dart';
import 'package:upj_digital_canteen/constants.dart';
import 'package:upj_digital_canteen/homescreen.dart';
import 'package:upj_digital_canteen/login.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
              TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  labelText: 'Email',
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  labelText: 'Name',
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
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
              ),
              SizedBox(height: 25),
              TextField(
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
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContinueButton(),
                  LoginButton(),
                ],
              )
            ],
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
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({
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
