import 'package:d_navigation_bar/d_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam6/pages/main_pages/heart_page.dart';
import 'package:flutter_exam6/pages/main_pages/home_page.dart';
import 'package:flutter_exam6/pages/main_pages/profile.dart';
import 'package:flutter_exam6/svg_icons.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final DNavigationBarController dNavigationBarController = DNavigationBarController(pages: pages);
  static List<Widget> pages = const [HomePage(), HeartPage(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dNavigationBarController.page,
      backgroundColor: Colors.white,
      bottomNavigationBar: DNavigationBar(
        controller: dNavigationBarController,
        onChanged: (_) => setState((){}),
        useShadow: false,
        items: [
          DNavigationBarItem(
            icon: const SvgIcon(SvgIcons.homeBorder),
            activeIcon: const SvgIcon(SvgIcons.home),
          ),
          DNavigationBarItem(
            icon: const SvgIcon(SvgIcons.heartBorder),
            activeIcon: const SvgIcon(SvgIcons.heart),
          ),
          DNavigationBarItem(
            icon: const SvgIcon(SvgIcons.profileBorder),
            activeIcon: const SvgIcon(SvgIcons.profile),
          ),
        ],
      ),
    );
  }
}

