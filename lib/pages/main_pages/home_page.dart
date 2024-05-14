import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam6/pages/all_nutrition.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 100),
          const Center(
            child: Text("Hello Shambhavi,",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xff91C788),
                fontSize: 30
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text("Find, track and eat heathy food.",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xff7B7B7B),
                fontSize: 18
              ),
            ),
          ),
          const SizedBox(height: 40),
          TextField(
            onSubmitted: (value) => Navigator.push(context, CupertinoPageRoute(builder: (context) => AllNutrition(text: value))),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffF4F4F4),
              hintText: 'Junk Food',
              prefixIcon: const Icon(CupertinoIcons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide.none
              )
            ),
          ),
          const SizedBox(height: 100),
          Container(
            height: 88,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: const Color(0xffA3A0CA)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Track Your\nWeekly Progress",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white
                  ),
                ),
                Container(
                  width: 98,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("View Now",
                        style: TextStyle(
                          color: Color(0xff9E9BC7),
                          fontSize: 12
                        )
                      ),
                      Icon(Icons.play_arrow_rounded, color: Color(0xff9E9BC7))
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text("Choose Your Favorites", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          const SizedBox(height: 20),
          SizedBox(
            height: 144,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 132,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFF2F0),
                    borderRadius: BorderRadius.circular(32)
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  width: 132,
                  decoration: BoxDecoration(
                    color: const Color(0xffEFF7EE),
                    borderRadius: BorderRadius.circular(32)
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  width: 132,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFF8EB),
                    borderRadius: BorderRadius.circular(32)
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
