import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class PageStop extends StatefulWidget {
  const PageStop({super.key});

  @override
  State<PageStop> createState() => _PageStopState();
}

class _PageStopState extends State<PageStop> {
  int sec = 0, min = 0, hour = 0;
  String digitsec = "00", digitmin = "00", digithour = "00";
  List laps = [];
  Timer? timer;
  bool started = false;
  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  void reset() {
    timer!.cancel();
    setState(() {
      sec = 0;
      min = 0;
      hour = 0;
      digithour = "00";
      digitmin = "00";
      digitsec = "00";
      started = false;
    });
  }

  void Start() {
    started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int ls = sec + 1;
      int lm = min;
      int lh = hour;

      if (ls > 59) {
        if (lm > 59) {
          lh++;
          lm = 0;
        } else {
          lm++;
          ls = 0;
        }
      }
      setState(() {
        sec = ls;
        min = lm;
        hour = lh;
        digitsec = (sec >= 10) ? "$sec" : "0$sec";
        digithour = (hour >= 10) ? "$hour" : "0$hour";
        digitmin = (min >= 10) ? "$min" : "0$min";
      });
    });
  }

  void addLaps() {
    String lap = "$digithour:$digitmin:$digitsec";
    setState(() {
      laps.add(lap);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://img.freepik.com/premium-photo/abstract-background-design-images-wallpaper-ai-generated_643360-173898.jpg?size=626&ext=jpg")),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "StopWatch",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, top: 40),
                          child: Icon(
                            Icons.settings,
                            color: Colors.white70,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          "$digithour:$digitmin:$digitsec",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 82,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      height: 400,
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(8)),
                      child: ListView.builder(
                        itemCount: laps.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Lap  ${index + 1}",
                                  style: TextStyle(
                                      color: Colors.white10, fontSize: 22),
                                ),
                                Text(
                                  "Lap  ${laps[index]}",
                                  style: TextStyle(
                                      color: Colors.white10, fontSize: 22),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: ElevatedButton(
                          onPressed: () {
                            (!started) ? Start() : stop();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff323f68),
                              shape: StadiumBorder(
                                  side: BorderSide(color: Colors.blue))),
                          child: Text(
                            (!started) ? "start" : "pause",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        )),
                        IconButton(
                            onPressed: () {
                              addLaps();
                            },
                            icon: Icon(
                              Icons.flag,
                              color: Colors.white,
                              size: 30,
                            )),
                        Expanded(
                            child: ElevatedButton(
                          onPressed: () {
                            reset();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff323f68),
                              shape: StadiumBorder(
                                  side: BorderSide(color: Colors.blue))),
                          child: Text(
                            "Reset",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
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
                            Navigator.of(context).pop();
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
                                  .pushReplacementNamed('clock_watch');
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
            )
          ],
        ),
      ),
    );
  }
}
