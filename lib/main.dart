import 'package:adani/facultyProfileScreen.dart';
import 'package:adani/faculty_login.dart';
import 'package:adani/studentProfileScreen.dart';
import 'package:adani/student_login.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_core/firebase_core.dart';
import './course.dart';
import 'firebase_options.dart';
import 'dart:html';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false, home: FacultyProfileScreen()));
}

final List<course> c = [
  new course(9.99, "PYTHON", "assets/images/course1.png"),
  new course(9.99, "CYBER SECURITY", "assets/images/course2.png"),
  new course(9.99, "CLOUD COMPUTING", "assets/images/course3.png")
];

final Map<String, String> news = {
  "16 NOV": "HACKATHON 2022",
  "27 NOV": "MARATHON 2022",
};

final List<String> eventImg = [
  "assets/poster/event2.png",
  "assets/poster/event1.png",
  "assets/poster/event3.png",
];
final Map<String, String> events = {
  "NAVRATRI":
      "Navaratri is an annual Hindu festival observed in the honour of the goddess Durga.",
  "GANESH CHATURTHI":
      "Ganesh chaturthi is a Hindu festival commemorating the birth of the Hindu god Ganesha",
  "REPUBLIC DAY":
      "Republic Day is a public holiday in India where the country marks and celebrates the date on which the Constitution of India came into effect on 26 January 1950."
};

var eventData = events.entries.toList();

//final
var newsData = news.entries.toList();
final List<String> poster = [
  "assets/poster/poster1.png",
  "assets/poster/poster2.png",
  "assets/poster/poster3.png",
  "assets/poster/poster4.png",
];
final List<String> program = [
  "PROGRAMS",
  "INFRASTRUCTRE",
];

final List<List<String>> images = [
  ["MBA", "PGDM (IM)", "PGDM (LAW)", "B.TECH", "M.TECH"],
  ["LIBRARY", "GROUND", "LAB", "CLASSROOM"]
];

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    _scrollController = ScrollController();
    super.initState();
  }

  //MediaQuery mediaQuery = new MediaQuery(data: data, child: child)

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      isAlwaysShown: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12,
          toolbarHeight: 70,
          leadingWidth: double.infinity,
          leading: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                child: Image.asset(
                  'assets/images/logo.png',
                  //fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          //     actions: [
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Image.asset('assets/images/logo.png'),
          //     ],
          //   )
          // ],
          actions: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "HOME",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "INSTITUTES",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "FACILIIES",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "CONTACT US",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "ABOUT US",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "MORE",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 40,
                )
              ],
            )
          ],
        ),
        body: Stack(children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "asset/images/uni.png",
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(children: [
              Container(
                height: 603,
                width: double.infinity,
                child: CarouselSlider(
                  options: CarouselOptions(
                    disableCenter: true,
                  ),
                  items: poster
                      .map(
                        (e) => Image.asset(
                          e.toString(),
                          height: 600,
                        ),
                      )
                      .toList(),
                ),
              ),
              Column(
                children: [
                  Container(
                    //color: Color(0xfff0B74B0),
                    decoration: BoxDecoration(
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
                    height: 60,
                    width: double.infinity,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: ((context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 70, vertical: 15),
                                  child: Text(
                                    program[index].toString() + " ",
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              );
                            }),
                            itemCount: program.length,
                            scrollDirection: Axis.horizontal,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 250,
                    width: double.infinity,
                    child: Center(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: images[_selectedIndex].length,
                        itemBuilder: ((context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 100,
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white,
                                  child: Image.asset("assets/images/logo.png"),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  images[_selectedIndex][index].toString(),
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              _institute(context),
              _news(context),
              _events(context),
              _admission(context),
              _acadamics(context),
              _placement(context),
              _aboutus(context),
              _contactUs(context),
            ]),
          ),
        ]),
      ),
    );
  }
}

Widget _contactUs(context) {
  return Container(
    child: Column(children: [
      Container(
        decoration: BoxDecoration(
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
        height: 60,
        //color: Color(0xff0B74B0),
        width: double.infinity,
        child: Center(
          child: Text(
            "CONTACT US",
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 20,
              // ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "ADDRESS: SHANTIGRAM TOWNSHIP. NR. VAISHNODEVI CIRCLE,SG HIGHWAY, \n                     AHMEDABAD-382421, GUJARAT, INDIA",
                ),
              ),
              // SizedBox(
              //   height: 20,
              // ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("TEL: +91 79 25555 6592"),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: 20,
              // ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "SOCIAL MEDIA",
                ),
              ),
              // SizedBox(
              //   height: 20,
              // ),
              Row(
                children: [
                  Image.asset("assets/images/fb.png"),
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset("assets/images/yt.png"),
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset("assets/images/linked.png"),
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset("assets/images/tw.png"),
                  SizedBox(
                    width: 20,
                  ),
                ],
              )
            ],
          )
        ]),
      )
    ]),
  );
}

Widget _aboutus(context) {
  return Container(
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
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
          height: 60,
          //color: Color(0xff0B74B0),
          width: double.infinity,
          child: Center(
            child: Text(
              "ABOUT US",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          height: 300,
          //color: Colors.blue,
          width: double.infinity,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
              width: 800,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        "ADANI UNIVERSITY",
                        style: TextStyle(
                          letterSpacing: 2.0,
                          color: Colors.black87,
                          fontFamily: "Alata",
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      child: Center(
                        child: Text(
                          "With a vision to educate and empower the youth, to encourage transformative research that focuses on real-world problems, and to contribute to global sustainability via excellence at all levels, the Adani Group – one of India’s largest transport and utility infrastructure conglomerates with inspiration from the infrastructure and visionaries of India – Shri Gautambhai Adani and Smt. Pritiben Adani – has established the Adani University in the enterprising State of Gujarat in India.",
                          style: TextStyle(
                            color: Colors.black26,
                            fontFamily: "Alata",
                            fontSize: 15,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/gautam.png"),
              radius: 100,
            ),
          ]),
        )
      ],
    ),
  );
}

Widget _placement(context) {
  return Container(
    child: Column(children: [
      Container(
        decoration: BoxDecoration(
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
        height: 60,
        //color: Color(0xff0B74B0),
        width: double.infinity,
        child: Center(
          child: Text(
            "PLACEMENT",
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 6.0,
        ),
        itemCount: 49,
        itemBuilder: ((context, index) {
          return Container(
              //padding: EdgeInsets.symmetric(horizontal: 50),
              //margin: EdgeInsets.symmetric(horizontal: 80, vertical: 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              height: 20,
              width: 30,
              child: Image.asset(
                  "assets/placement/logo${index + 1}.png".toString()));
        }),
      ),
    ]),
  );
}

Widget _acadamics(context) {
  return Container(
    child: Column(children: [
      Container(
        decoration: BoxDecoration(
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
        height: 60,
        // color: Color(0xff0B74B0),
        width: double.infinity,
        child: Center(
          child: Text(
            "ACADEMICS",
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 3,
        itemBuilder: ((context, index) {
          return Container(
            //padding: EdgeInsets.symmetric(horizontal: 50),
            margin: EdgeInsets.symmetric(horizontal: 80, vertical: 50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            height: 150,
            width: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(children: [
                  Column(
                    children: [
                      Card(
                        child: Image.asset(
                          c[index].photo.toString(),
                          height: 250,
                          width: 450,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: double.infinity,
                        color: Color(0xfff0B74B0),
                        child: Center(
                          child: Text(
                            c[index].name,
                            style: TextStyle(
                              letterSpacing: 2.0,
                              color: Colors.white,
                              fontFamily: "Alata",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 70,
                    color: Color(0xfff75479C),
                    child: Center(
                        child: Text(
                      '\$' + c[index].price.toString(),
                      style: TextStyle(
                        letterSpacing: 2.0,
                        color: Colors.white,
                        fontFamily: "Alata",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  )
                ]),
                Container(
                  height: 40,
                  width: double.infinity,
                  color: Color(0xfff0B74B0),
                  child: Center(
                    child: Text(
                      "ADD TO CART",
                      style: TextStyle(
                        letterSpacing: 2.0,
                        color: Colors.white,
                        fontFamily: "Alata",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    ]),
  );
}

Widget _news(context) {
  return Container(
    child: Column(children: [
      Container(
        decoration: BoxDecoration(
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
        height: 60,
        width: double.infinity,
        // color: Color(0xfff0B74B0),
        child: Center(
          child: Text(
            "LATEST NEWS",
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 15,
      ),
      ListView.builder(
        shrinkWrap: true,
        itemCount: news.length,
        itemBuilder: ((context, index) {
          return Container(
            margin: EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      height: 100,
                      width: 500,
                      child: Center(
                          child: Text(
                        newsData[index].value,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color(0xfff75479C),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                newsData[index].key.substring(0, 2),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Roboto",
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                newsData[index].key.substring(3),
                                style: TextStyle(color: Colors.white),
                              ),
                            ]),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        shape: BoxShape.circle,
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
                    ),
                  ],
                )
              ],
            ),
          );
        }),
      ),
    ]),
  );
}

Widget _events(context) {
  return Container(
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
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
          height: 60,
          width: double.infinity,
          //color: Color(0xff0B74B0),
          child: Center(
            child: Text(
              "EVENTS",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 3,
          itemBuilder: ((context, index) {
            return Container(
              //padding: EdgeInsets.symmetric(horizontal: 50),
              margin: EdgeInsets.symmetric(horizontal: 80, vertical: 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              height: 150,
              width: 50,
              child: Column(
                children: [
                  Card(
                    child: Image.asset(
                      eventImg[index].toString(),
                      height: 250,
                      width: 450,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    eventData[index].key.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Roboto",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Text(
                      eventData[index].value.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Roboto",
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ],
    ),
  );
}

Widget _admission(context) {
  return Container(
    child: Column(children: [
      Container(
        decoration: BoxDecoration(
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
        height: 60,
        //color: Color(0xff0B74B0),
        width: double.infinity,
        child: Center(
          child: Text(
            "ADMISSION",
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Container(
        height: 500,
        //color: Colors.blue,
        width: double.infinity,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            width: 800,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "ADMISSIONS OPEN",
                      style: TextStyle(
                        letterSpacing: 2.0,
                        color: Color(0xfffb850ff),
                        fontFamily: "Alata",
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    child: Center(
                      child: Text(
                        "ADANI UNIVERSITY TO BE A GLOBAL LEADING ACADEMIC UNIVERSITY IN THE INFRASTRUCTURE SECTOR CONTRIBUTING TO NATION BUILDING",
                        style: TextStyle(
                          color: Colors.black26,
                          fontFamily: "Alata",
                          fontSize: 20,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "STUDENT PLACED",
                            style: TextStyle(
                              fontFamily: "Alata",
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0xfffb850ff),
                            ),
                          ),
                          Text(
                            "5K+",
                            style: TextStyle(
                              fontFamily: "Alata",
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black26,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "STUDENT ENROLLED",
                            style: TextStyle(
                              fontFamily: "Alata",
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0xfffb850ff),
                            ),
                          ),
                          Text(
                            "6K+",
                            style: TextStyle(
                              fontFamily: "Alata",
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black26,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    height: 50,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Color(0xfff3ed9d1),
                        borderRadius: BorderRadius.circular(25)),
                    child: Center(
                      child: Text(
                        "APPLY NOW",
                        style: TextStyle(
                            fontFamily: "Alata",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ]),
          ),
          Image.asset("assets/images/Vector2.png"),
        ]),
      )
    ]),
  );
}

Widget _institute(context) {
  return Container(
    child: Column(children: [
      Container(
        decoration: BoxDecoration(
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
        height: 60,
        //color: Color(0xff0B74B0),
        width: double.infinity,
        child: Center(
          child: Text(
            "INSTITUTES",
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/aiie.png"),
            SizedBox(
              width: 100,
            ),
            Image.asset("assets/images/aiim.png"),
          ],
        ),
      )
    ]),
  );
}
