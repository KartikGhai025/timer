import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:productivity_timer/settings.dart';
import 'package:productivity_timer/timermodel.dart';
import 'package:productivity_timer/widgets.dart';
import '../timer.dart';

class TimerHomePage extends StatelessWidget {
  static String id= 'homepage';
  final CountDownTimer timer = CountDownTimer();
  final double defaultPadding = 5.0;
  void emptyMethod() {}

  @override

  Widget build(BuildContext context) {
    final List<PopupMenuItem<String>> menuItems = [];
    menuItems.add(const PopupMenuItem(
      value: 'Settings',
      child: Text('Settings'),
    ));

    // timer.startWork();
    //  timer.stream();
    return Scaffold(
        appBar: AppBar(

            title: Text('My work timer'),
            actions: [
              PopupMenuButton<String>(
                onSelected: (value) {
                  Navigator.pushNamed(context, SettingsScreen.id);
                },

                itemBuilder: (BuildContext context) {
                  return menuItems.toList();
                },
              ),
              // TextButton(
              // child: Text('button'
              // ),
              //   onPressed:(){
              // Navigator.pushNamed(context, SettingsScreen.id);}
              // ,
              // )
            ]
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double availableWidth = constraints.maxWidth;
              timer.startWork();
              return Column(children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(defaultPadding),
                    ),
                    Expanded(
                        child: ProductivityButton(
                            color: Color(0xff009688),
                            text: "Work",
                            onPressed: () => timer.startWork())),
                    Padding(
                      padding: EdgeInsets.all(defaultPadding),
                    ),
                    Expanded(
                        child: ProductivityButton(
                            color: Color(0xff607D8B),
                            text: "Short Break",
                            onPressed: () => timer.startBreak(true))),
                    Padding(
                      padding: EdgeInsets.all(defaultPadding),
                    ),
                    Expanded(
                        child: ProductivityButton(
                            color: Color(0xff455A64),
                            text: "Long Break",
                            onPressed: () => timer.startBreak(false))),
                  ],
                ),

                Expanded(
                    child: StreamBuilder<Object>(
                      //initialData: '00:00',
                        stream: timer.stream(),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          TimerModel timer = (snapshot.data == '00:00')
                              ? TimerModel('00:00', 1)
                              : snapshot.data;
                          return Expanded(
                              child: CircularPercentIndicator(
                                radius: availableWidth / 2,
                                lineWidth: 10.0,
                                percent: timer.percent,
                                center: Text(timer.time,
                                    style: Theme.of(context).textTheme.headline4),
                                progressColor: Color(0xff009688),
                              ));
                        })),

                //   stream: timer.stream(),
                //   builder: (context, snapshot) {
                //     return CircularPercentIndicator(
                //       radius: availableWidth / 2,
                //       lineWidth: 10.0,
                //       percent: timer.radius,
                //       center: Text(timer.time1,
                //           style: Theme.of(context).textTheme.headline4),
                //       progressColor: Color(0xff009688),
                //     );
                //   }
                // ),),

                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(defaultPadding),
                    ),

                    Expanded(
                        child: ProductivityButton(
                            color: Color(0xff212121),
                            text: 'Stop',
                            onPressed: () => timer.stopTimer())),
                    Padding(
                      padding: EdgeInsets.all(defaultPadding),
                    ),
                    Expanded(
                        child: ProductivityButton(
                            color: Color(0xff009688),
                            text: 'Restart',
                            onPressed: () => timer.startTimer())),

                    // Expanded(child: ProductivityButton(color: Color(0xff212121),
                    // text: 'Stop', onPressed: emptyMethod)),
                    // Padding(padding: EdgeInsets.all(defaultPadding),),
                    // Expanded(child: ProductivityButton(color: Color(0xff009688),
                    // text: 'Restart', onPressed: emptyMethod)),
                    // Padding(padding: EdgeInsets.all(defaultPadding),),
                  ],
                )
              ]);
            }));
  }
}
