# Time Sclupt

- This Flutter project is a simple digital clock app with a glass-like design. It displays the current time, date, and features navigation buttons to access other pages within the app.
 
  For Mobile : https://github.com/divyansiranpariya/Time_Sclupt

## Features

* Displays current time with hour and minute digits.
* Updates in real-time with smooth animation.
* Shows the current date.
* Glass-like design for aesthetic appeal.
*  Set multiple alarms with different times.
*  Toggle alarms on or off.
*  Sleek and modern design with glass-like UI elements.
* Set a countdown timer.
*  Start, pause, and reset the timer.



## Folder Structure
* Here is the core folder structure which flutter provides.

 flutter-app/
 |- android
 |- build
 |- ios
 |- lib
 |- test

* Here is the folder structure we have been using in this project

 lib/
|- view/
|- utilities/
|- main.dart

## view
- This directory view all the screen of the application together in one place. A separate file is created for each type as shown in example below:

 view/
|- home_Page.dart
|- clock.dart
|- time.dart
|-alarm.dart
|-time_st.dart

## Main
* This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

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

## Usage
* Once the app is running, you'll see the clock displaying the current time and date.
* You can navigate to different pages within the app using the icons at the bottom of the screen.
* You can start, pause, and reset the stopwatch using the buttons provided.
* To record a lap, press the lap button. The recorded laps will be displayed below the stopwatch.

## Contributing
Contributions are welcome! If you find any bugs or have suggestions for improvements, please feel free to open an issue or create a pull request.
