import 'package:bsfinal/AC.dart';
import 'package:flutter/material.dart';
import 'package:bsfinal/Fan.dart';
import 'package:bsfinal/Dishwasher.dart';
import 'package:bsfinal/Oven.dart';
import 'package:bsfinal/Ref.dart';
import 'package:bsfinal/TV.dart';


void main(){
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: home(),
      )
  );
}

class home extends StatefulWidget {

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 35),
        child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white,
                      Colors.lightBlueAccent,
                    ],
                  ),
                ),
                height: 100,
                child: Row(
                  children: [
                    Text('  Appliance',style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    ),
                    Icon(

                      Icons.arrow_forward_ios_outlined,
                      color: Colors.blue,),
                    Padding(
                        padding: const EdgeInsets.only(left: 95.0),
                        child:
                        Row(
                          children: [
                            Image.asset('assets/images/app-removebg-preview.png',
                            ),
                          ],
                        )
                    )
                  ],
                ),
              ),
              SizedBox(height: 70.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: [
                      SizedBox(width: 5,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Fan(),
                            ),
                          );
                        },
                        child: Column(
                            children: [

                              CircleAvatar(
                                radius: 45,
                                backgroundImage: AssetImage(
                                    'assets/images/fan.jpg'),
                              ),
                              Text('Fan',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold ),
                              ),

                            ]
                        ),
                      ),
                      SizedBox(width: 30.0,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  Dishwasher(),
                            ),
                          );
                        },
                        child: Column(
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundImage: AssetImage(
                                    'assets/images/dishwasher.jpg'),
                              ),
                              Text('Dishwasher',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ]
                        ),
                      ),
                      SizedBox(width: 30.0,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Oven(),
                            ),
                          );
                        },
                        child: Column(
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundImage: AssetImage(
                                    'assets/images/oven.jpg'),
                              ),
                              Text('Oven',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ]
                        ),
                      ),
                    ] // backgroundColor: Colors.transparent,
                ),
              ),
              SizedBox(height: 30.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: [
                      SizedBox(width: 5,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Ref(),
                            ),
                          );
                        },
                        child: Column(
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundImage: AssetImage(
                                    'assets/images/ref.jpg'),
                              ),
                              Text('Refrigerator',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ]
                        ),
                      ),
                      SizedBox(width: 30.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  TV(),
                            ),
                          );
                        },
                        child: Column(
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundImage: AssetImage('assets/images/tv.jpeg'),
                              ),
                              Text('Television',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ]
                        ),
                      ),
                      SizedBox(width: 30.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  AC(),
                            ),
                          );
                        },
                        child: Column(
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundImage: AssetImage(
                                    'assets/images/ac.jpg'),
                              ),
                              Text('      Air\nConditioner',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ]
                        ),
                      ),
                    ] // backgroundColor: Colors.transparent,
                ),
              ),
            ]
        ),
      ),

    );

  }
}





