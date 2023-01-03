import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_screen.dart';

void main(){
//  readJsonAndAppendCandes();
runApp(
MaterialApp(actions: null,
title: "Flutter Candle",
home:MyApp(),
theme: ThemeData.dark(),
)

);
}


class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return MyAppState();

}

}
class MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
  
}