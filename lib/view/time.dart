import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class timePage extends StatefulWidget {
  const timePage({super.key});

  @override
  State<timePage> createState() => _timePageState();
}

class _timePageState extends State<timePage> {
  int count = 15;
  late Timer timer;

  void startTimer() {
    count = 15;
    timer = Timer.periodic(Duration(seconds: 4), (timer) {
      if (count > 0) {
        setState(() {
          count--;
        });
      }
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 55,
                              bottom: 70,
                              left: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Timer",
                                  style: TextStyle(
                                      fontSize: 35, color: Colors.white),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 5, top: 10, left: 245),
                                  child: Icon(
                                    Icons.settings,
                                    color: Colors.white70,
                                    size: 30,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white10,
                          height: 250,
                          width: 250,
                          child: Text(
                            "$count",
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              startTimer();
                            },
                            child: Text("Start Time"),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                timer.cancel();
                              },
                              child: Text("Pause")),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 10),
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                timer.cancel();
                              });
                            },
                            child: Text("Reset")),
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
                                      .pushReplacementNamed('AlaramPagm');
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
                                  Navigator.of(context)
                                      .pushReplacementNamed('clock_watch');
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
      ),
    );
  }
}
