import 'package:adani/studentProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _fire = FirebaseFirestore.instance;

TextEditingController _email = new TextEditingController();
TextEditingController _pass = new TextEditingController();

class StudentLoginScreen extends StatelessWidget {
  const StudentLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/uni.png"),
                    fit: BoxFit.cover),
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 120, vertical: 30),
              //height: 300,
              width: 300,
              child: Image.asset("assets/images/adani.png")),
          Center(
            child: Container(
              height: 600,
              width: 350,
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
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "STUDENT LOGIN",
                    style: TextStyle(
                        wordSpacing: 2.0,
                        fontFamily: "Alata",
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Center(
                    child: Text(
                      "YOU CAN LOGIN WITH YOUR UNIVERSITY ID AND PASSWORD",
                      style: TextStyle(
                        fontFamily: "Alata",
                        fontSize: 15,
                        color: Colors.white54,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: _email,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Lato",
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        margin: EdgeInsets.only(left: 10, right: 5),
                        child: SvgPicture.asset(
                          "vector/email.svg",
                          color: Colors.white,
                        ),
                      ),
                      prefixIconConstraints: BoxConstraints(maxHeight: 20),
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: Colors.white30,
                        fontFamily: "Lato",
                        fontSize: 14,
                      ),
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: _pass,
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Lato",
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        margin: EdgeInsets.only(left: 10, right: 5),
                        child: SvgPicture.asset(
                          "vector/lock.svg",
                          color: Colors.white,
                        ),
                      ),
                      prefixIconConstraints: BoxConstraints(maxHeight: 20),
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: Colors.white30,
                        fontFamily: "Lato",
                        fontSize: 14,
                      ),
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () async {
                    try {
                      await _auth
                          .signInWithEmailAndPassword(
                              email: _email.text.toString(),
                              password: _pass.text.toString())
                          .then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => StudentProfileScreen()));
                      });
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.toString()),
                        ),
                      );
                    }
                  },
                  child: Container(
                    child: Center(
                        child: GradientText(
                      colors: [
                        Color(0xfff0B74B0),
                        Color(0xfff75479C),
                        Color(0xfffBD3861),
                      ],
                      "LOGIN",
                      style: TextStyle(
                          wordSpacing: 10.0,
                          fontFamily: "Lato",
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    )),
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

void _login() async {}
