import 'package:flutter/material.dart';

import '../svg_icons.dart';

Widget notFound({
  required String iconPath,
  required String text1,
  required String text2
}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
        child: SvgIcon(iconPath),
      ),
      const SizedBox(height: 20),
      Text(text1,
        style: const TextStyle(color: Color(0xff696969), fontSize: 22, fontWeight: FontWeight.w400)
      ),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(text2,
          style: const TextStyle(color: Color(0xffA9A9A9), fontSize: 16, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
      )
    ],
  );
}