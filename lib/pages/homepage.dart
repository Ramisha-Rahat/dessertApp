import 'package:dessertapp/components/FoodTile.dart';
import 'package:dessertapp/models/food.dart';
import 'package:dessertapp/models/shop.dart';
import 'package:dessertapp/pages/cart_page.dart';
import 'package:dessertapp/pages/detailspage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool _isFavourite=false;

  //after creating shop.dart we do not need this list here
 // List foodMenu=[
    //Cookie
  //   Food(name: 'Choc-Cookie', price: '200', rating: '4.8', imagePath: 'assets/images/cookies.png' ),
  //   //Donut
  //   Food(name: 'Strawberry Donut', price: '300', rating: '4.5', imagePath: 'assets/images/doughnut.png' ),
  //   //Pastry
  //   Food(name: 'Pastry', price: '350', rating: '5', imagePath: 'assets/images/pastry.png' ),
  //   //IceCream
  //   Food(name: 'Ice-cream', price: '450', rating: '4.7', imagePath: 'assets/images/ice-cream.png' )
  // ];


  //navigation to food detail page?
  void navigateToFoodDetailPage(int index){

    final shop= context.read<Shop>();
    //final foodMenu = shop.foodMenu;
    final foodMenu = shop.foodMenu;


    Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => DetailPage(
            food:foodMenu[index],
          ),
        ));
  }




  @override
  Widget build(BuildContext context) {

    final shop= context.read<Shop>();
    final foodMenu = shop.foodMenu;

    return Scaffold(
      backgroundColor: Color(0xFFFFDAB9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
       leading:Icon(Icons.menu, color: Colors.deepOrangeAccent,),
        title: Text('Wecome To Sweet Sensation',style:TextStyle(
          color: Colors.deepOrangeAccent,fontSize: 16,
          fontStyle: FontStyle.italic,
        ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
               Navigator.push(context,MaterialPageRoute(
                   builder: (context)=> MyCartPage(),),
               );
            },
           icon: Icon(Icons.shopping_cart, color: Colors.deepOrangeAccent,),
          ),
        ],
      ),
       body: SingleChildScrollView(
         child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.all(25.0),
               child: Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(35),
                     color: Colors.deepOrangeAccent.shade200,
                   ),
                   height: 200,
                   child: Row(
                     children: [
                       Container(
                       child: Column(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.all(25),
                                   child: Text('Get 20% Off Promo',style: TextStyle(
                                     color: Color(0xFFFFDAB9),
                                     fontSize: 20,
                                     fontStyle: FontStyle.italic,
                                   ),),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(10.0),
                                   child: ElevatedButton(onPressed: (){},
                                     style: ElevatedButton.styleFrom( // Transparent to show AnimatedContainer color
                                         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                       backgroundColor: Color(0xFFFFDAB9),
                                     ),
                                       child: Row(
                                         children: [
                                           Text('Redeem',style: TextStyle(
                                             fontStyle: FontStyle.italic,
                                             color: Colors.deepOrangeAccent,
                                           ),),
                                           Icon(Icons.arrow_forward,color: Colors.deepOrangeAccent,),
                                         ],
                                       )
                                   ),
                                 ),
                         ],
                       )
                       ),
         
                       Image.asset('assets/images/donut.png', width: 100,),
                     ],
                   ),
                 ),
             ),
             Padding(
               padding: const EdgeInsets.all(15.0),
               child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Your Sweet Cravings',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                       enabledBorder: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.deepOrangeAccent),
                         borderRadius: BorderRadius.circular(30.0),
                      ),
                      ),
                   ),
             ),

             SizedBox(
               height: 50,
                 child: Text('Favourites',style: TextStyle(
                   fontStyle: FontStyle.italic,fontSize: 25,color: Colors.deepOrangeAccent,
                 ),),
             ),
               SizedBox(
                 height: 350,
                   child: ListView.builder(
                     scrollDirection: Axis.horizontal,
                     itemCount: foodMenu.length,
                       itemBuilder: (context, index) =>FoodTile(
                         food: foodMenu[index],
                         onTap: (){
                           navigateToFoodDetailPage(index);
                         },
                       ),
                   ),
                 ),

             const SizedBox(height: 25,),
         
             Padding(
               padding: const EdgeInsets.all(20.0),
               child: Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(35),
                   color: Colors.deepOrangeAccent.shade200,
                 ),
                 height: 150,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Image.asset('assets/images/kitkat ice-cream.png', width: 100,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                          Text('Icecream', style: TextStyle(color: Color(0xFFFFDAB9), fontSize: 20),),
                           Text('Rs. 450')
                         ],
                       ),
                        IconButton(onPressed: (){
                               setState(() {
                                 _isFavourite = !_isFavourite;
                               });
                        },
                          icon: Icon(_isFavourite ? Icons.favorite : Icons.favorite_border),),

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