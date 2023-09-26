import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/onboarding/onboard_Screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  double height = 0.0, width = 0.0;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    // width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: Colors.blue,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height * .40,
              child: Image.asset("assets/images/online.jpg"),
            ),
            Center(
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(text: "Finding the"),
                        TextSpan(
                            text: " Perfect\nOnline Course",
                            style: TextStyle(
                              color: Colors.deepOrange,
                            )),
                        TextSpan(text: " for You")
                      ])),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "App to search and discover the most suitable\nplace for you to stay.",
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 17, right: 17),
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>OnboardScreen(),));
              },
                  child: Text("Let's get started", style: Theme.of(context).textTheme.displaySmall,)),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already Have an account?", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                TextButton(onPressed: (){}, child: Text("Sign In",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16)))
              ],
            )

          ],
        ),
      ),
    );
  }
}
