import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String icon;
  final double? width;
  final double? height;
  final Color? color;

  const SvgIcon(this.icon, {
    this.width,
    this.height,
    this.color,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return SvgPicture.asset(icon, width: width, height: height, color: color);
  }
}

@immutable
sealed class SvgIcons {
  static const String home = "assets/icons/home.svg";
  static const String homeBorder = "assets/icons/home_border.svg";
  static const String heart = "assets/icons/heart.svg";
  static const String heartBorder = "assets/icons/heart_border.svg";
  static const String profile = "assets/icons/profile.svg";
  static const String profileBorder = "assets/icons/profile_border.svg";
  static const String homeNotFound = "assets/icons/home_not_found.svg";
}
