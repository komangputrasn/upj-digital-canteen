/// goals:
/// 1. update the checkout page to reflect the correct subtotal for each order menus (done)
/// 2. do the same for the bottom modal sheet (done)
/// 3. send the checkout to the ongoing
/// 4. prevent duplicate items (done)
/// 5. create the about us page
/// 6. enable file picker
/// 7. add validation to forms in edit profile
/// 8. connect to DB for login/signup
/// 9. unfocus textfield when dismissing keyboard (done)
/// TODO: make sure there are no duplicates name for foods

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login.dart';
import 'states.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SelectedFoodsProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xffcd042e)),
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: LoginScreen(),
    );
  }
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }

  return MaterialColor(color.value, swatch);
}
