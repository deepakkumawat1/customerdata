import 'package:flutter/material.dart';
import './ui/home.dart';
import 'ui/subpage.dart';
void main() => runApp(MaterialApp(
  title: "welcome to Product details App",
  color: Colors.red,
  home: Scaffold(
    appBar: AppBar(
      title: new Text("Product Details"),
      centerTitle: true,
      backgroundColor: Colors.pinkAccent[100],
    ),
    body: home(),
  ),
));