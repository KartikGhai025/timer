import 'package:flutter/material.dart';
import 'package:productivity_timer/Timerhomepage.dart';
import 'package:productivity_timer/settings.dart';
import 'package:productivity_timer/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import './timer.dart';
import './timermodel.dart';

void main() {
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  final CountDownTimer timer = CountDownTimer();
  final double defaultPadding = 5.0;
  void emptyMethod() {}

  @override
  Widget build(BuildContext context) {
    timer.startWork();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'My Work Timer',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        // home:
        // //SettingsScreen(),
        //  TimerHomePage()
        initialRoute: TimerHomePage.id,
      routes: {
        TimerHomePage.id :(context) => TimerHomePage(),
        SettingsScreen.id:(context)=> SettingsScreen()
      },
    );
  }
}

