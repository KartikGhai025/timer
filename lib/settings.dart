import 'package:flutter/material.dart';
import 'package:productivity_timer/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import './widgets.dart';

class SettingsScreen extends StatelessWidget {
  static String id = 'Settingpage';
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Settings());
  }
}

class Settings extends StatefulWidget {

  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // late SharedPreferences prefs;
  // static const String WORKTIME = "workTime";
  // static const String SHORTBREAK = "shortBreak";
  // static const String LONGBREAK = "longBreak";
  late int workTime;
  late int shortBreak;
  late int longBreak;
  // late TextEditingController txtWork;
  // late TextEditingController txtShort;
  // late TextEditingController txtLong;
  TextStyle textStyle = TextStyle(fontSize: 24);

  @override
  // void initState() {
  //   TextEditingController txtWork = TextEditingController();
  //   TextEditingController txtShort = TextEditingController();
  //   TextEditingController txtLong = TextEditingController();
  //   super.initState();
  // }

  Widget build(BuildContext context) {

    return GridView.count(
      scrollDirection: Axis.vertical,
      crossAxisCount: 3,
      childAspectRatio: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
        children: <Widget>[
        Text("Work",
            style: textStyle
        ),
      Text(""),
      Text(""),
      SettingButton(color:Color(0xff455A64),text: "-",value: -1),
      TextField(
        //  controller: txtWork,
          style: textStyle,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number),
      SettingButton(color:Color(0xff009688),text:" +",value: 1,),
      Text("Short",
       style: textStyle
      ),
      Text(""),
      Text(""),
      SettingButton(color:Color(0xff455A64),text: "-",value: -1, ),
      TextField(
         // controller: txtShort,

          style: textStyle,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number),
      SettingButton(color:Color(0xff009688),text: "+",value: 1),
      Text("Long",
    style: textStyle,
      ),
      Text(""),
      Text(""),
      SettingButton(color:Color(0xff455A64),text: "-",value: -1,),
      TextField(
      //  controller: txtLong,
      style: textStyle,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number),
          SettingButton(color:Color(0xff009688),text:  "+",value:  1,),
        ],

      padding: const EdgeInsets.all(20.0),
    );
  }

}
