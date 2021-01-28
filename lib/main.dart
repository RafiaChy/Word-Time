import 'package:flutter/material.dart';
import 'package:world_time/screens/delay.dart';
import 'package:world_time/screens/home.dart';
import 'package:world_time/screens/location.dart';

void main() {
  runApp(MaterialApp(
    //initialRoute: '/home',
    routes: {
      '/': (context) => Delay(),
      '/home': (context) => Home(),
      '/location': (context) => Location(),
    },
  ));
}
