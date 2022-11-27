import 'dart:ui';

import 'package:adani/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({super.key});

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

int _selectedIndex = 0;
final List<String> profileKey = [
  "STUDENT NAME:",
  "STUDENT UID:",
  "DOB:",
  "MOBILE:",
  "ADDRESS:",
  "EMAIL:",
  "COURSE:",
  "BRANCH:",
  "CPI:",
  "CGPA:"
];

final List<String> profileValue = [
  "AMIGO COMDER",
  "22CONTRA2022",
  "1-JAN-2004",
  "+91 1234567890",
  "AHEMDABAD",
  "AMIGO@GMAIL.COM",
  "B.TECH",
  "COMPUTER SCIENCE",
  "9.0",
  "8.99"
];

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(blurRadius: 15.0)],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              tileMode: TileMode.clamp,
              end: Alignment.bottomRight,
              colors: [
                Color(0xfff0B74B0),
                Color(0xfff75479C),
                Color(0xfffBD3861),
              ],
            ),
          ),
          width: 342,
          child: Drawer(
            backgroundColor: Color(0xfffd79922),
            child: ListView(children: [
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/profile.png"),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "AMIGO COMDER",
                      style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Builder(
                builder: (context) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      //margin: EdgeInsets.only(right: 90),
                      height: 60,
                      child: Center(
                        child: Text(
                          "MY PROFILE",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Lato",
                              fontSize: 19),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.black.withOpacity(0.2),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    //margin: EdgeInsets.only(right: 90),
                    height: 60,
                    child: Center(
                      child: Text(
                        "MY ATTENDANCE",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Lato",
                            fontSize: 19),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.black.withOpacity(0.2),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  //margin: EdgeInsets.only(right: 90),
                  height: 60,
                  child: Center(
                    child: Text(
                      "EXAM FORM",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Lato",
                          fontSize: 19),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.black.withOpacity(0.2),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  //margin: EdgeInsets.only(right: 90),
                  height: 60,
                  child: Center(
                    child: Text(
                      "ONLINE PAYMENT",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Lato",
                          fontSize: 19),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.black.withOpacity(0.2),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 60,
                  // margin: EdgeInsets.only(right: 90),
                  child: Center(
                    child: Text(
                      "ONLINE PAYMENT HISTORY",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Lato",
                          fontSize: 19),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.black.withOpacity(0.2),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 60,
                  // margin: EdgeInsets.only(right: 90),
                  child: Center(
                    child: Text(
                      "LOG OUT",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Lato",
                          fontSize: 19),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.black.withOpacity(0.2),
              ),
            ]),
          ),
        ),
        Container(
          width: 1364,
          child: Center(child: _myProfie(context)),
        )
      ]),
    );
  }
}

Widget _myProfie(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: 50,
      ),
      Center(
        child: Text(
          "STUDENT PROFILE",
          style: TextStyle(
            fontSize: 40,
            fontFamily: 'Alata',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      SizedBox(
        height: 50,
      ),
      Container(
          margin: EdgeInsets.symmetric(horizontal: 100),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: profileKey.length,
            itemBuilder: (context, index) {
              return Table(
                columnWidths: {
                  0: FlexColumnWidth(3),
                  1: FlexColumnWidth(8),
                },
                border: TableBorder.all(),
                children: [
                  TableRow(children: [
                    Center(
                      child: Text(
                        profileKey[index].toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        profileValue[index].toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Lato',
                          //fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ])
                ],
              );
            },
          ))
    ],
  );
}
