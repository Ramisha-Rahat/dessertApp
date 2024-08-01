import 'package:dessertapp/models/food.dart';
import 'package:dessertapp/pages/payment.dart';
import 'package:flutter/material.dart';
import 'package:dessertapp/models/shop.dart';
import 'package:provider/provider.dart';



class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {

void deleteItem(Food food, BuildContext context ){
  final shop= context.read<Shop>();
  shop.removeCart(food);
}

  @override
  Widget build(BuildContext context) {



    return  Consumer<Shop>(
      builder: (context,value,child) => Scaffold(
        backgroundColor: Color(0xFFFFDAB9),
        appBar:AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          foregroundColor: Color(0xFFFFDAB9),
          title: Text('My Cart',),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context,index){

                  final Food food= value.cart[index];

                  final String foodName=food.name;
                  final String foodPrice=food.price;

                  return ListTile(
                    title: Text(foodName),
                    subtitle: Text(foodPrice),
                    trailing: IconButton(
                      icon: Icon(Icons.delete ,color: Colors.deepOrangeAccent,),
                      onPressed: () => deleteItem(food, context),
                    ),

                  );


                },
              ),

            ),
           SizedBox(height: 10,),
            Container(
              color: Colors.deepOrangeAccent,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Total Price: ',style: TextStyle(color: Color(0xFFFFDAB9), fontSize: 20),),
                  Text('Rs. ${value.getTotalPrice()}',style: TextStyle(color: Color(0xFFFFDAB9), fontSize: 20),),
                ],
              )
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.deepOrangeAccent.shade200,
              ),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Go To Payment", style: TextStyle(color:Color(0xFFFFDAB9), fontSize: 25),),
                  IconButton(onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder:(context)=> MyPaymentPage()),
                    );
                  }, icon: Icon(Icons.arrow_forward, color: Color(0xFFFFDAB9),),
                  )
                ],
              ),
            )


           ],
        ),
      ),
    );

  }
}
