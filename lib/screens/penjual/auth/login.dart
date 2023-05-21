import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:upj_digital_canteen/auth.dart';
import 'package:upj_digital_canteen/firestore.dart';
import 'package:upj_digital_canteen/screens/penjual/auth/sign_up.dart';

class MerchantLoginScreen extends StatelessWidget {
  MerchantLoginScreen({super.key});

  final nameTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              HeaderDecoration(),
              SizedBox(
                height: 40,
              ),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              LoginTextField(
                nameTextEditingController: emailTextEditingController,
                name: 'Email',
                icon: Icons.email,
              ),
              SizedBox(height: 18),
              LoginTextField(
                nameTextEditingController: nameTextEditingController,
                name: 'Password',
                icon: Icons.password,
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContinueButton(),
                  GoToSignUpButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GoToSignUpButton extends StatelessWidget {
  const GoToSignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        minimumSize: MaterialStateProperty.all(Size(180, 50)),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MerchantSignUpScreen(),
          ),
        );
      },
      child: Text(
        'I want to sign up',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        minimumSize: MaterialStateProperty.all(Size(180, 50)),
      ),
      child: Text(
        'Continue',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    super.key,
    required this.nameTextEditingController,
    required this.name,
    required this.icon,
  });

  final TextEditingController nameTextEditingController;
  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: nameTextEditingController,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        labelText: name,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        prefixIcon: Icon(icon),
      ),
    );
  }
}

class HeaderDecoration extends StatelessWidget {
  const HeaderDecoration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/upj_logo.png',
          height: 60,
          width: 60,
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          'Masuk sebagai penjual',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
