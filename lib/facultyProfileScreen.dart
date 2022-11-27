import 'package:flutter/material.dart';
import 'dart:html';

import 'package:flutter_svg/flutter_svg.dart';

class FacultyProfileScreen extends StatefulWidget {
  const FacultyProfileScreen({super.key});

  @override
  State<FacultyProfileScreen> createState() => _FacultyProfileScreenState();
}

class _FacultyProfileScreenState extends State<FacultyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: 300,
            color: Color(0xfff0a234b),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "vector/teacher.svg",
                      height: 30,
                    ),
                    Center(
                        child: Text(
                      "FACULTY PORTAL",
                      style: TextStyle(
                          fontFamily: "Alata",
                          fontSize: 22,
                          color: Colors.white),
                    )),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
