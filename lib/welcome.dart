import 'package:flutter/material.dart';
import 'package:upj_digital_canteen/constants.dart';
import 'package:upj_digital_canteen/screens/pembeli/auth/auth.dart';
import 'package:upj_digital_canteen/screens/pembeli/auth/login.dart';
import 'package:upj_digital_canteen/screens/penjual/auth/auth.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/welcome_image.jpg'),
              Positioned(
                left: 20,
                top: 100,
                child: AppDescription(),
              ),
              GradientDecorator()
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ContinueAsMerchantButton(),
              ),
              Expanded(
                child: ContinueAsUserButton(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AppDescription extends StatelessWidget {
  const AppDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 280,
          child: Text(
            kWelcomeText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 280,
          child: Text(
            kWelcomePageAppDescription,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class GradientDecorator extends StatelessWidget {
  const GradientDecorator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 617,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [Colors.transparent, Colors.black45],
          stops: [0.0, 4],
        ),
      ),
    );
  }
}

class ContinueAsUserButton extends StatelessWidget {
  const ContinueAsUserButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          goToUserAuthScreen(context);
        },
        child: Container(
          height: 249,
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Masuk sebagai',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Civitas UPJ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void goToUserAuthScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UserAuthScreen(),
      ),
    );
  }
}

class ContinueAsMerchantButton extends StatelessWidget {
  const ContinueAsMerchantButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          goToMerchantAuthScreen(context);
        },
        child: Container(
          height: 249,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Masuk sebagai',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 13),
                ),
                Text(
                  'Resto Kantin',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void goToMerchantAuthScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MerchantAuthScreen(),
      ),
    );
  }
}
