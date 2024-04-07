import 'dart:math';

import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class AlaramPage extends StatefulWidget {
  const AlaramPage({super.key});

  @override
  State<AlaramPage> createState() => _AlaramPageState();
}

class _AlaramPageState extends State<AlaramPage> {
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
  bool Switchval = false;
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, bottom: 15, top: 30),
                                child: Text(
                                  "Alarm",
                                  style: TextStyle(
                                      fontSize: 34,
                                      color: Colors.white,
                                      letterSpacing: 2),
                                ),
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 15, top: 30),
                              child: Icon(
                                Icons.settings,
                                color: Colors.white70,
                                size: 30,
                              ),
                            )
                          ],
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
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        width: 340,
                        color: Colors.lightGreen.shade400,
                        height: 253,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 14),
                                child: GlassContainer.frostedGlass(
                                  height: 65,
                                  width: 300,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(17)),
                                  borderWidth: 0.1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "5:00 am",
                                          style: TextStyle(fontSize: 22.5),
                                        ),
                                        Switch(
                                            value: Switchval,
                                            onChanged: (val) {
                                              setState(() {
                                                Switchval = val;
                                              });
                                            })
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 14),
                                child: GlassContainer.frostedGlass(
                                  height: 65,
                                  width: 300,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(17)),
                                  borderWidth: 0.1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "7:30 am",
                                          style: TextStyle(fontSize: 22.5),
                                        ),
                                        Switch(
                                            value: Switchval,
                                            onChanged: (val) {
                                              setState(() {
                                                Switchval = val;
                                              });
                                            })
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 14),
                                child: GlassContainer.frostedGlass(
                                  height: 65,
                                  width: 300,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(17)),
                                  borderWidth: 0.1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "11:20 am",
                                          style: TextStyle(fontSize: 22.5),
                                        ),
                                        Switch(
                                            value: Switchval,
                                            onChanged: (val) {
                                              setState(() {
                                                Switchval = val;
                                              });
                                            })
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 14),
                                child: GlassContainer.frostedGlass(
                                  height: 65,
                                  width: 300,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(17)),
                                  borderWidth: 0.1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "12:00 pm",
                                          style: TextStyle(fontSize: 22.5),
                                        ),
                                        Switch(
                                            value: Switchval,
                                            onChanged: (val) {
                                              setState(() {
                                                Switchval = val;
                                              });
                                            })
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 14),
                                child: GlassContainer.frostedGlass(
                                  height: 65,
                                  width: 300,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(17)),
                                  borderWidth: 0.1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "2:00 pm",
                                          style: TextStyle(fontSize: 22.5),
                                        ),
                                        Switch(
                                            value: Switchval,
                                            onChanged: (val) {
                                              setState(() {
                                                Switchval = val;
                                              });
                                            })
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 14),
                                child: GlassContainer.frostedGlass(
                                  height: 65,
                                  width: 300,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(17)),
                                  borderWidth: 0.1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "6:10 pm",
                                          style: TextStyle(fontSize: 22.5),
                                        ),
                                        Switch(
                                            value: Switchval,
                                            onChanged: (val) {
                                              setState(() {
                                                Switchval = val;
                                              });
                                            })
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 14),
                                child: GlassContainer.frostedGlass(
                                  height: 65,
                                  width: 300,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(17)),
                                  borderWidth: 0.1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "8:00 pm",
                                          style: TextStyle(fontSize: 22.5),
                                        ),
                                        Switch(
                                            value: Switchval,
                                            onChanged: (val) {
                                              setState(() {
                                                Switchval = val;
                                              });
                                            })
                                      ],
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
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
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
                                Navigator.of(context)
                                    .pushReplacementNamed('PageStop');
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
                                Navigator.of(context)
                                    .pushReplacementNamed('clock_watch');
                                ;
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
                                //  Navigator.of(context).pushNamed('clock_watch');
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
