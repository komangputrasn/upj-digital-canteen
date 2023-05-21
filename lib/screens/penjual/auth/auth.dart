import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:upj_digital_canteen/auth.dart';
import 'package:upj_digital_canteen/firestore.dart';

class MerchantAuthScreen extends StatefulWidget {
  MerchantAuthScreen({super.key});

  @override
  State<MerchantAuthScreen> createState() => _MerchantAuthScreenState();
}

class _MerchantAuthScreenState extends State<MerchantAuthScreen> {
  final nameTextFieldController = TextEditingController();
  final emailTextFieldController = TextEditingController();
  final passwordTextFieldController = TextEditingController();
  final confirmPasswordTextFieldController = TextEditingController();

  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
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
              isLogin
                  ? MerchantLoginForm(
                      emailTextEditingController: emailTextFieldController,
                      nameTextEditingController: passwordTextFieldController)
                  : MerchantSignUpForm(
                      nameTextEditingController: nameTextFieldController,
                      emailTextEditingController: emailTextFieldController,
                      passwordTextEditingController:
                          passwordTextFieldController,
                    ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(180, 50)),
                    ),
                    child: Text(
                      isLogin ? 'I want to sign up' : 'I want to login',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(180, 50)),
                    ),
                    onPressed: () async {
                      print(emailTextFieldController.text);
                      print(passwordTextFieldController.text);
                      isLogin
                          ? await loginUser(context)
                          : await signUpUser(context);
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loginUser(BuildContext context) async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: emailTextFieldController.text,
        password: passwordTextFieldController.text,
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
  }

  Future<void> signUpUser(BuildContext context) async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: emailTextFieldController.text,
        password: passwordTextFieldController.text,
      );
      MerchantData().addMerchantToCollection(
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
  }
}

class MerchantLoginForm extends StatelessWidget {
  const MerchantLoginForm({
    super.key,
    required this.emailTextEditingController,
    required this.nameTextEditingController,
  });

  final TextEditingController emailTextEditingController;
  final TextEditingController nameTextEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        AuthTextField(
          nameTextEditingController: emailTextEditingController,
          name: 'Email',
          icon: Icons.email,
        ),
        SizedBox(height: 18),
        AuthTextField(
          nameTextEditingController: nameTextEditingController,
          name: 'Password',
          icon: Icons.password,
        ),
      ],
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

class AuthTextField extends StatelessWidget {
  const AuthTextField({
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

class SignUpForms extends StatelessWidget {
  const SignUpForms({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MerchantSignUpForm extends StatelessWidget {
  const MerchantSignUpForm({
    super.key,
    required this.nameTextEditingController,
    required this.emailTextEditingController,
    required this.passwordTextEditingController,
  });

  final TextEditingController nameTextEditingController;
  final TextEditingController emailTextEditingController;
  final TextEditingController passwordTextEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sign up',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        AuthTextField(
          nameTextEditingController: nameTextEditingController,
          name: 'Name',
          icon: Icons.person,
        ),
        SizedBox(height: 18),
        AuthTextField(
          nameTextEditingController: emailTextEditingController,
          name: 'Email',
          icon: Icons.email,
        ),
        SizedBox(height: 18),
        AuthTextField(
          nameTextEditingController: passwordTextEditingController,
          name: 'Password',
          icon: Icons.password,
        ),
      ],
    );
  }
}
