import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:upj_digital_canteen/auth.dart';
import 'package:upj_digital_canteen/constants.dart';
import 'package:upj_digital_canteen/firestore.dart';
import 'package:upj_digital_canteen/screens/pembeli/auth/signup.dart';
import 'package:upj_digital_canteen/screens/pembeli/homescreen/homescreen_main.dart';

class UserAuthScreen extends StatefulWidget {
  UserAuthScreen({super.key});

  @override
  State<UserAuthScreen> createState() => _UserAuthScreenState();
}

class _UserAuthScreenState extends State<UserAuthScreen> {
  final emailTextFieldController = TextEditingController();
  final nameTextFieldController = TextEditingController();
  final passwordTextFieldController = TextEditingController();
  final confirmPasswordTextFieldController = TextEditingController();

  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              isLogin
                  ? UserLoginForms(
                      emailTextEditingController: emailTextFieldController,
                      passwordTextEditingController:
                          passwordTextFieldController,
                    )
                  : UserSignUpForm(
                      emailTextFieldController: emailTextFieldController,
                      passwordTextFieldController: passwordTextFieldController,
                      nameTextFieldController: nameTextFieldController,
                      confirmPasswordTextFieldController:
                          confirmPasswordTextFieldController,
                    ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _proceedAuthButton(),
                  _switchAuthTypeButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Material _proceedAuthButton() {
    return Material(
      child: InkWell(
        onTap: () async {
          debugPrint('user email: ${Auth().currentUser?.email}');
          if (isLogin) {
            if (!allLoginFormsAreFilled()) {
              _displaySnackBar('Please fill all forms!');
              return;
            } else {
              _loginUser();
            }
          } else {
            if (allSignUpFormsAreFilled() && bothPasswordFieldMatch()) {
              await _signUpUser();
              addUserToCollection();
            } else {
              _displaySnackBar(
                  'Please fill all forms or make sure the passwords match');
            }
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

  void _displaySnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void addUserToCollection() {
    UserData().addUserToCollection(
      uid: Auth().currentUser!.uid,
      username: nameTextFieldController.text,
    );
  }

  Future<void> _signUpUser() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: emailTextFieldController.text,
        password: passwordTextFieldController.text,
      );
    } on FirebaseAuthException catch (e) {
      _showErrorMessage(e);
      return;
    }

    _switchToUserHomeScreen();
  }

  Future<void> _loginUser() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: emailTextFieldController.text,
        password: passwordTextFieldController.text,
      );
    } on FirebaseAuthException catch (e) {
      _showErrorMessage(e);
      return;
    }

    _switchToUserHomeScreen();
  }

  void _showErrorMessage(FirebaseAuthException e) {
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

  void _switchToUserHomeScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  Material _switchAuthTypeButton() {
    return Material(
      child: InkWell(
        onTap: () {
          setState(() {
            isLogin = !isLogin;
          });
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
              isLogin ? 'I want to sign up' : 'I want to login',
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

  void loginUser() async {
    if (!allLoginFormsAreFilled()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all fields!'),
        ),
      );
      return;
    }
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
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
      // print(e.message);
    }
  }

  bool allLoginFormsAreFilled() {
    return emailTextFieldController.text.isNotEmpty &&
        passwordTextFieldController.text.isNotEmpty;
  }

  bool allSignUpFormsAreFilled() {
    return emailTextFieldController.text.isNotEmpty &&
        passwordTextFieldController.text.isNotEmpty &&
        nameTextFieldController.text.isNotEmpty &&
        confirmPasswordTextFieldController.text.isNotEmpty;
  }

  bool bothPasswordFieldMatch() {
    return passwordTextFieldController.text ==
        confirmPasswordTextFieldController.text;
  }
}

class UserLoginForms extends StatelessWidget {
  const UserLoginForms({
    super.key,
    required this.emailTextEditingController,
    required this.passwordTextEditingController,
  });

  final TextEditingController emailTextEditingController;
  final TextEditingController passwordTextEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Login',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30,
        ),
        TextField(
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
        ),
        SizedBox(
          height: 30,
        ),
        TextField(
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
        ),
      ],
    );
  }
}

class UserSignUpForm extends StatelessWidget {
  const UserSignUpForm({
    super.key,
    required this.emailTextFieldController,
    required this.passwordTextFieldController,
    required this.nameTextFieldController,
    required this.confirmPasswordTextFieldController,
  });

  final TextEditingController emailTextFieldController;
  final TextEditingController nameTextFieldController;
  final TextEditingController passwordTextFieldController;
  final TextEditingController confirmPasswordTextFieldController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sign up',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30,
        ),
        TextField(
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
        ),
        SizedBox(
          height: 25,
        ),
        TextField(
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
        ),
        SizedBox(
          height: 25,
        ),
        TextField(
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
        ),
        SizedBox(height: 25),
        TextField(
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
        ),
      ],
    );
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
