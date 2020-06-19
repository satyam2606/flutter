//import 'package:Myapp/bg.dart';
//import 'package:Myapp/drawer.dart';
//import 'package:Myapp/pages/home_page.dart';
import 'package:Myapp/pages/home_page.dart';
import 'package:Myapp/pages/login_page.dart';
import 'package:Myapp/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'ChangeNameCard.dart';
 
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Constants.prefs = await SharedPreferences.getInstance();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title:"Awesome App",
    home: Constants.prefs.getBool("loggedIn")==true
    ? HomePage()
    : LoginPage(),
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    routes: {
      "/login":(context)=>LoginPage(),
      "/home":(context)=>HomePage(),
    },
    ));
}


