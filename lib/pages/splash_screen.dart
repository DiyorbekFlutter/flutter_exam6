import 'package:flutter/material.dart';
import 'package:flutter_exam6/pages/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MainPage()), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff91C788),
      body: Stack(
        children: [
          Center(
            child: Text("kcal",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 60)
            ),
          ),
          Align(
            alignment: Alignment(0, 0.8),
            child: Text("ZUAMICA",
              style: TextStyle(
                fontFamily: "Nunito",
                fontWeight: FontWeight.w800,
                fontSize: 25,
                color: Color(0xffCFE7CB)
              ),
            ),
          )
        ],
      ),
    );
  }
}
