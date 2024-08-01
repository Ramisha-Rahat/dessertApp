import 'package:dessertapp/pages/mainpage.dart';
import 'package:flutter/material.dart';



class MyPaymentPage extends StatefulWidget {
  const MyPaymentPage({super.key});

  @override
  State<MyPaymentPage> createState() => _MyPaymentPageState();
}

class _MyPaymentPageState extends State<MyPaymentPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFDAB9),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            children:[
              SizedBox(height: 50,),
              Image.asset('assets/images/donut.png', width: 200,),
              Text('Thank You! Enjoy Your Sweets', style: TextStyle(fontSize: 30, color: Colors.deepOrangeAccent),),
            Spacer(),
              Container(
                color: Colors.deepOrangeAccent,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Back To start',style: TextStyle(fontSize: 30, color: Color(0xFFFFDAB9)),),
                      IconButton(onPressed: (){
                        Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context)=> MyMainPage())
                        );
                      }, icon: Icon(Icons.home_filled, color: Color(0xFFFFDAB9),),)
                    ],
                  ),
                ),
              )
              
          ]
          ),
        ),
      ),
    );
  }
}