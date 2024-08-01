import 'package:dessertapp/models/food.dart';
import 'package:dessertapp/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class DetailPage extends StatefulWidget {
  final Food food;
  const DetailPage({super.key, required this.food});


  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  //for quantity

  int quantityCount=0;
  //dec quantity
  void dec_quantity(){
  setState(() {
    if(quantityCount>0) {
      quantityCount--;
    }
  });
  }
  //inc quantity
  void inc_quantity(){
    setState(() {
      quantityCount++;
    });
  }

  //for add to cart button
 void MyCart(){

    if(quantityCount>0){

      final shop = context.read<Shop>();

      shop.addToCart(widget.food, quantityCount);

      showDialog(context: context,
          barrierDismissible: false,
          builder: (context)=> AlertDialog(
            backgroundColor: Colors.deepOrangeAccent,
            content: Text('Successfully Added to Your Cart'),
            actions: [

             IconButton(onPressed: (){
               Navigator.pop(context);
             },
                 icon: Icon(Icons.done, color: Color(0xFFFFDAB9),),),
            ],
          ),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFDAB9),
      body: Column(

        children: [
          Expanded(
              child: ListView(
                children: [

                  SizedBox(height: 25,),
                  //image
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(widget.food.imagePath, height: 200, width: 200,),
                  ),

                  //food name

                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.food.name, style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 30,
                          decoration: TextDecoration.underline, decorationColor: Colors.deepOrangeAccent),)
                        ],
                      ),
                  ),

                  //rating
                  SizedBox(height: 15,),

                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(widget.food.rating, style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 20)),
                        Icon(Icons.star, color:Colors.yellowAccent,),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  //desc
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Description:', style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 24,
                          ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Chocolate cookies offer a delightful blend of rich cocoa and sweet, buttery goodness that melts in your mouth. Each bite delivers a satisfying crunch followed by a soft, gooey center, creating a perfect balance of texture and flavor. Ideal for satisfying any sweet craving, chocolate cookies are a timeless treat that brings warmth and comfort to every moment.',
                            style: TextStyle(fontStyle: FontStyle.italic,fontSize: 15),),
                          )
                        ],
                      ),
                    ),
                  ),

                  Spacer(),

                   Container(
                      color: Colors.deepOrangeAccent,
                     height: 150,
                     child:Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text('Rs.'+ widget.food.price ,
                                style: TextStyle(color: Color(0xFFFFDAB9), fontSize: 20),),
                            ),
                          Row(
                           children: [
                             Container(
                               decoration: BoxDecoration(
                                 color: Color(0xFFFFDAB9),
                                 shape: BoxShape.rectangle,
                               ),
                               child: IconButton(
                                 icon: Icon(Icons.remove),
                                 onPressed: dec_quantity,
                               ),
                             ),
                             SizedBox(width: 10,),
                             Text(
                               quantityCount.toString(),
                               style: TextStyle(fontSize: 20, color: Colors.black),
                             ),
                             SizedBox(width: 10,),
                             Container(
                               decoration: BoxDecoration(
                                 color: Color(0xFFFFDAB9),
                                 shape: BoxShape.rectangle,
                               ),
                               child: IconButton(
                                 icon: Icon(Icons.add),
                                 onPressed: inc_quantity,
                               ),
                             ),
                             SizedBox(
                               width: 20,
                             ),
                             ElevatedButton.icon(
                               onPressed: () {
                                 MyCart();
                               },
                               icon: Icon(Icons.shopping_cart, color: Colors.deepOrangeAccent), // Add icon
                               label: Text(
                                 'Add to cart',
                                 style: TextStyle(color: Colors.deepOrangeAccent), // Style text
                               ),
                               style: ElevatedButton.styleFrom(
                                 backgroundColor: Color(0xFFFFDAB9), // Button color
                                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(20), // Rounded corners
                                 ),
                               ),
                             ),
                           ],
                          ),
                          ],
                        ),
                      ),


                ],

          )
          ),
        ],

      ),
    );
  }
}