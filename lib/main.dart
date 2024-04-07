import 'package:flutter/material.dart';
import 'package:tick_trove/view/alarm.dart';
import 'package:tick_trove/view/clock.dart';
import 'package:tick_trove/view/home_Page.dart';
import 'package:tick_trove/view/time.dart';
import 'package:tick_trove/view/time_st.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'clock_watch': (context) => const clock_watch(),
        'PageStop': (context) => const PageStop(),
        'AlaramPagm': (context) => const AlaramPage(),
        'timePage': (context) => const timePage(),
      },
    ),
  );
}
