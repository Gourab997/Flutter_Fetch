import 'package:app/news_app.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewAppScreen(),
      initialRoute: NewAppScreen.path,
      routes: {
        NewAppScreen.path :(context)=> NewAppScreen(),
      },
  ));}
