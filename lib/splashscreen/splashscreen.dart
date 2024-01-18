import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myloginpage/home/homescreen.dart';
import 'package:myloginpage/login/form.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEYLOGIN = "login";

  @override
  void initState() {
    super.initState();

    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Color.fromARGB(255, 78, 60, 110),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.format_align_left,
              size: 50,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Please Wait...',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(KEYLOGIN);
    

    Timer(Duration(seconds: 2), () {

      if(isLoggedIn!=null){
        if(isLoggedIn){
          Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }else{
          Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => FormPage()));
        }
      }
      else{
        Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => FormPage()));
      }

      
    });
  }
}
