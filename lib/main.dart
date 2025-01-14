import 'package:flutter/material.dart';
import 'package:flutter_exam6/pages/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      home: const SplashScreen(),
    );
  }
}

