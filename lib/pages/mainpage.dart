import 'package:dessertapp/pages/homepage.dart';
import 'package:flutter/material.dart';


class MyMainPage extends StatefulWidget {
  const MyMainPage({super.key});


  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/Untitled design.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 60,
              left: 20,
              child: Text(
                'Sweet Sensation',
                style:TextStyle(
                  color: Color(0xFFFFDAB9),fontSize: 45,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,
                  decoration:
                TextDecoration.underline,decorationColor:Color(0xFFFFDAB9),
                ),
              ),
            ),
            Positioned(
              top:200,
                left: 70,
                child: Text(
                  "Sweeter With Every Bite", style:TextStyle(
                    color: Colors.brown[500],fontSize: 20, fontStyle: FontStyle.italic,fontWeight: FontWeight.bold
                ),
                ),
            ),
            Positioned(
              bottom: 20,
              left: 10,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, 
                      MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                      ));
                    },
                    style: ElevatedButton.styleFrom(// Transparent to show AnimatedContainer color
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      backgroundColor: Color(0xFFFFDAB9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Let`s Dive In To Sweetness',
                          style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward, color: Colors.deepOrangeAccent),
                      ],

              ),
            ),
            ),
        ],
        ),
      ),
    );
  }
}