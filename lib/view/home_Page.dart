import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime time = DateTime.now();
  double sec = (3 * pi) / 2;
  int secDigit = 0;
  double min = (3 * pi) / 2;
  int minDigit = 0;
  double hour = (3 * pi) / 2;
  int hourDigit = 0;
  int date = 0;
  int month = 0;
  int year = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      minDigit = time.minute;
      secDigit = time.second;
      hourDigit = time.hour;
      date = time.day;
      month = time.month;
      year = time.year;
      sec = sec + secDigit * (pi / 30);
      min = min + minDigit * (pi / 30);
      hour = hour + hourDigit * (pi / 6);
    });
    timer();
  }

  void timer() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        if (secDigit >= 59) {
          sec = (3 * pi) / 2;
          secDigit = 0;
          minDigit++;
          min = min + (pi / 30);
        } else if (minDigit >= 59) {
          sec = (3 * pi) / 2;
          minDigit = 0;
          hourDigit++;
          hour = hour + (pi / 6);
        } else if (hourDigit >= 12) {
          hour = (3 * pi) / 2;
          hourDigit = 0;
        } else {
          secDigit++;
          sec = sec + (pi / 30);
        }
      });
      timer();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://img.freepik.com/premium-photo/abstract-background-design-images-wallpaper-ai-generated_643360-173898.jpg?size=626&ext=jpg"))),
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 15),
                            child: Text(
                              "Clock",
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                  letterSpacing: 2),
                            ),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 148),
                          child: Text(
                            "$hourDigit:$minDigit",
                            style: TextStyle(color: Colors.white, fontSize: 60),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 172),
                          child: Text(
                            "$date-$month-$year",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    GlassContainer.frostedGlass(
                      alignment: Alignment.center,
                      height: 310,
                      color: Color(0xFFffffff).withOpacity(0.10),
                      width: 310,
                      borderRadius: BorderRadius.circular(25),
                      // shape: BoxShape.circle,
                      borderWidth: 0.2,
                      child: Container(
                          width: 215,
                          height: 215,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.lightGreen.shade400,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Transform.rotate(
                                angle: 2 * pi,
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "XII",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              Transform.rotate(
                                angle: 60,
                                child: Container(
                                  alignment: Alignment(-0.17, 1),
                                  child: Text(
                                    "I",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              Transform.rotate(
                                angle: 60.35,
                                child: Container(
                                  alignment: Alignment(-0.31, 0.99),
                                  child: Text(
                                    "II",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              Transform.rotate(
                                angle: pi / 2,
                                child: Container(
                                  alignment: Alignment(0, -1),
                                  child: Text(
                                    "III",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              Transform.rotate(
                                angle: 65,
                                child: Container(
                                  alignment: Alignment(0, -1.05),
                                  child: Text(
                                    "IIII",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              Transform.rotate(
                                angle: 50,
                                child: Container(
                                  alignment: Alignment(0.25, 1),
                                  child: Text(
                                    "V",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              Transform.rotate(
                                angle: 2 * pi,
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "  VI",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              Transform.rotate(
                                angle: 70,
                                child: Container(
                                  alignment: Alignment(-0.1, 1),
                                  child: Text(
                                    "VIII",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              Transform.rotate(
                                angle: 44.50,
                                child: Container(
                                  alignment: Alignment(0.1, 1),
                                  child: Text(
                                    "VII",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              Transform.rotate(
                                angle: pi / 2,
                                child: Container(
                                  alignment: Alignment(0, 1),
                                  child: Text(
                                    "XI",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              Transform.rotate(
                                angle: 175,
                                child: Container(
                                  alignment: Alignment(-0.1, -1),
                                  child: Text(
                                    "X",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              Transform.rotate(
                                angle: 175,
                                child: Container(
                                  alignment: Alignment(0.33, -0.94),
                                  child: Text(
                                    "XI",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              Transform.rotate(
                                angle: sec,
                                child: Divider(
                                  thickness: 2,
                                  indent: 107,
                                  endIndent: 20,
                                  color: Colors.black,
                                ),
                              ),
                              Transform.rotate(
                                angle: min,
                                child: Divider(
                                  thickness: 2,
                                  indent: 106,
                                  endIndent: 40,
                                  color: Colors.black,
                                ),
                              ),
                              Transform.rotate(
                                angle: hour,
                                child: Divider(
                                  thickness: 2,
                                  indent: 108,
                                  endIndent: 55,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    left: 45,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 28),
                        child: GlassContainer.frostedGlass(
                          height: 60,
                          width: 60,
                          color: Color(0xFFffffff).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                          borderWidth: 0.5,
                          borderColor: Colors.black,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('clock_watch');
                            },
                            icon: Icon(
                              Icons.watch_later,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: GlassContainer.frostedGlass(
                          height: 60,
                          width: 60,
                          color: Color(0xFFffffff).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                          borderWidth: 0.5,
                          borderColor: Colors.black,
                          child: Container(
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('PageStop');
                              },
                              icon: Icon(
                                Icons.watch,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 28),
                        child: GlassContainer.frostedGlass(
                          height: 60,
                          width: 60,
                          color: Color(0xFFffffff).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                          borderWidth: 0.5,
                          borderColor: Colors.black,
                          child: Container(
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('AlaramPagm');
                              },
                              icon: Icon(
                                Icons.alarm,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 28),
                        child: GlassContainer.frostedGlass(
                          height: 60,
                          width: 60,
                          color: Color(0xFFffffff).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                          borderWidth: 0.5,
                          borderColor: Colors.black,
                          child: Container(
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('timePage');
                              },
                              icon: Icon(
                                Icons.timelapse_rounded,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
