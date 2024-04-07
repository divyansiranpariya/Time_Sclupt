import 'dart:math';

import 'package:flutter/material.dart';

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      minDigit = time.minute;
      secDigit = time.second;
      hourDigit = time.hour;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Time Sculpt"),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Container(
                  alignment: Alignment.center,
                  height: 360,
                  width: 360,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.cyan.shade100,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.rotate(
                        angle: sec,
                        child: Divider(
                          thickness: 2,
                          indent: MediaQuery.of(context).size.width / 2.3,
                          endIndent: 25,
                          color: Colors.black,
                        ),
                      ),
                      Transform.rotate(
                        angle: min,
                        child: Divider(
                          thickness: 2,
                          indent: MediaQuery.of(context).size.width / 2.3,
                          endIndent: 39,
                          color: Colors.black,
                        ),
                      ),
                      Transform.rotate(
                        angle: hour,
                        child: Divider(
                          thickness: 2,
                          indent: MediaQuery.of(context).size.width / 2.3,
                          endIndent: 75,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "$hourDigit:$minDigit:$secDigit",
                style: TextStyle(
                  fontSize: 34,
                ),
              ),
            ],
          ),
        ));
  }
}
