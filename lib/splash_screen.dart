import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/welcome_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState (){
    super.initState();
    Timer(Duration(seconds:1), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> WelcomePage(),));
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/logo.svg"),
            SizedBox(
              height: 20,
            ),
            Text(
              "E-Learn",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
