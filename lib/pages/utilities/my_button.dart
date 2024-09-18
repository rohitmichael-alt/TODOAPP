// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

   MyButton({
    super.key,
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed:onPressed,
      color:const Color.fromARGB(255, 143, 139, 139),
      child:Text(text,style:TextStyle(fontSize:20)),



    );
  }
}