import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login.dart';
import 'states.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => SelectedFoodsProvider(),
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
        primarySwatch: Colors.pink,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: LoginScreen(),
    );
  }
}
