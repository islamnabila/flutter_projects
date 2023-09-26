import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardScreen1 extends StatelessWidget {
  const OnboardScreen1({super.key});

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
          children: [
            Container(
              child: Image.asset("assets/images/role.png"),
            )
          ],
        ),
      ),
    );
  }
}
