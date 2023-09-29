import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_grid/responsive_grid.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.white));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List pngImages = [
    {"img": "assets/icons/cloth.png", "title": "Casual Shirt"},
    {"img": "assets/icons/shirt.png", "title": "Formal Shirt"},
    {"img": "assets/icons/tshirt.png", "title": "Tshirt"},
    {"img": "assets/icons/polo.png", "title": "Polo Tshirt"},
    {"img": "assets/icons/jeans.png", "title": "Jeans"},
    {"img": "assets/icons/hoodie.png", "title": "Hoodies"},
    {"img": "assets/icons/suit.png", "title": "Suit"},
    {"img": "assets/icons/pants.png", "title": "Short Pants"},
    {"img": "assets/icons/cap.png", "title": "Cap"},
  ];

  List homeImage = [];
  TabController? _tabController;

  get key => null;
  ReadData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/homeImage.json")
        .then((s) {
      setState(() {
        homeImage = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    ReadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 42,
      ),
      body: Scrollbar(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      hintText: "Search Product",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent))),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 7,
              child: ListView.builder(
                  itemCount: pngImages.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey)),
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 32,
                                child: Image(
                                    image: AssetImage(
                                      pngImages[index]["img"],
                                    ),
                                    height:
                                        MediaQuery.of(context).size.height / 5,
                                    width:
                                        MediaQuery.of(context).size.height / 20)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            // width: MediaQuery.of(context).size.height / 10,
                            child: Center(
                                child: Text(
                          pngImages[index]["title"],
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade700),
                          maxLines: 1,
                        ))),
                      ],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommend for you",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style: TextStyle(fontSize: 16),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: GridView.builder(
                    itemCount: homeImage == null ? 0 : homeImage.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.64),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 16 / 18,
                            child: Container(
                                decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                (homeImage[index]["img"]),
                              ),fit: BoxFit.cover
                              ),
                            )
                            ),
                          ),
                          SizedBox(height: 5,),
                          Expanded(child: Text(homeImage[index]["title"],style: TextStyle(color: Colors.grey.shade700),)),
                          SizedBox(height: 3,),
                          Expanded(child: Text(homeImage[index]["text"],style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),maxLines: 1,)),
                          SizedBox(height: 3,),
                          Expanded(child: Text(homeImage[index]["Price"],style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)),
                          SizedBox(height: 10,),
                        ],
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
