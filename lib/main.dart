import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:week1Assignment/screens/home.dart';
import 'package:week1Assignment/screens/detail.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {'/details': (context) => DetailPage()},
    home: ListPage(),
  ));
}
