import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboard_screen1.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: Colors.blue,
        ),
      ),
      body: Stack(
        children:[
          PageView(
            controller: _pageController,
            children: [
              OnboardScreen1(),
              Container(
                color: Colors.pink.shade50,
              ),
              Container(
                color: Colors.deepOrange.shade50,
              )
            ],
          ),
          Align(
            alignment: Alignment(0, 0.75),
              child: SmoothPageIndicator(controller: _pageController, count: 3))
        ]
        ),


    );
  }
}
