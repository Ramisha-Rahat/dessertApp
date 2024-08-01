import 'package:flutter/material.dart';
import 'package:dessertapp/models/food.dart';

class FoodTile extends StatelessWidget{
   final Food food;
   final void Function()? onTap;

   const FoodTile(
   { super.key,
     required this.food,
     required this.onTap,
   });


   @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.deepOrangeAccent,
        ),
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Image.asset(food.imagePath,
              height: 100,
              ),
              SizedBox(height: 30,),
              Text(food.name, style:  TextStyle(
                  fontStyle: FontStyle.italic,fontSize: 25,color: Color(0xFFFFDAB9)),),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Rs.'+food.price),
                      SizedBox(width: 100,),
                      Row(
                        children: [
                      Text(food.rating),
                      Icon(Icons.star, color: Colors.yellow,),
                  ],
                      )
                    ],
                  ),
                ),
              ),

              ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom( // Transparent to show AnimatedContainer color
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    backgroundColor: Color(0xFFFFDAB9),
                  ),
                  child: Row(
                    children: [
                      Text('Add to cart   ',style: TextStyle(
                        fontStyle: FontStyle.italic,color: Colors.black,
                      ),),
                      Icon(Icons.shopping_cart, color: Colors.deepOrangeAccent,),
                    ],
                  )
              ),
            ],
          ),
        ),

      ),
    );
  }

}