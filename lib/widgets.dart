import 'package:flutter/material.dart';
@immutable
class ProductivityButton extends StatelessWidget {

   final Color color;
   final String text;
   //final double size;
   final VoidCallback onPressed;

   const ProductivityButton({required this.color, required this.text, required this.onPressed, });
  @override

  Widget build(BuildContext context) {
    return MaterialButton(
      child:Text(
          text,
          style: const TextStyle(color: Colors.white)),
      onPressed: onPressed,
      color: color,
     // minWidth: size,
    ); }
}


class SettingButton extends StatelessWidget {

  final Color color;
  final String text;
  final int value;


  const SettingButton({required this.color, required this.text, required this.value, });
  @override

  Widget build(BuildContext context) {
    return MaterialButton(
      child:Text(
          text,
          style: TextStyle(color: Colors.white)),
      onPressed: () => null,
      color: this.color,
    );
  }
}

//
//  class SettingButton extends StatelessWidget {
//  late final Color color;
//  late final String text;
//   late final int value;
//  const SettingsButton({required this.color, required this.text, required this.value});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//     );
//   }
// }
//
