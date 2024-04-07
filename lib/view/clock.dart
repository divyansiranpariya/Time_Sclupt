import 'dart:math';

import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class clock_watch extends StatefulWidget {
  const clock_watch({super.key});

  @override
  State<clock_watch> createState() => _clock_watchState();
}

class _clock_watchState extends State<clock_watch> {
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 22, bottom: 15),
                                child: Text(
                                  "Clock",
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.white,
                                      letterSpacing: 2),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Icon(
                                  Icons.settings,
                                  color: Colors.white70,
                                  size: 30,
                                ),
                              )
                            ],
                          ),
                          alignment: Alignment.topLeft,
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
                              CircularProgressIndicator(
                                backgroundColor: Colors.pink.withOpacity(0.7),
                                strokeWidth: 12,
                                strokeAlign: 15,
                                value: secDigit * (1 / 60),
                                color: Colors.pink,
                                strokeCap: StrokeCap.round,
                              ),
                              CircularProgressIndicator(
                                backgroundColor: Colors.blue.withOpacity(0.7),
                                strokeWidth: 10,
                                strokeAlign: 13,
                                value: minDigit * (1 / 60),
                                color: Colors.blue,
                                strokeCap: StrokeCap.round,
                              ),
                              CircularProgressIndicator(
                                backgroundColor: Colors.pink.withOpacity(0.7),
                                strokeWidth: 8,
                                strokeAlign: 11,
                                value: hourDigit * (1 / 6),
                                color: Colors.pink,
                                strokeCap: StrokeCap.round,
                              ),
                              Transform.rotate(
                                angle: sec,
                                child: Divider(
                                  thickness: 2,
                                  indent: 107,
                                  endIndent: 11,
                                  color: Colors.black,
                                ),
                              ),
                              Transform.rotate(
                                angle: min,
                                child: Divider(
                                  thickness: 2,
                                  indent: 106,
                                  endIndent: 35,
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
              flex: 4,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 200,
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
                              Navigator.of(context).pop('/');
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
