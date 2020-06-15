//import 'package:Myapp/bg.dart';
//import 'package:Myapp/drawer.dart';
import 'package:Myapp/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'ChangeNameCard.dart';
 
void main(){
  runApp(MaterialApp(
    title:"Awesome App",
    home: HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.purple,
    )
    ));
}


