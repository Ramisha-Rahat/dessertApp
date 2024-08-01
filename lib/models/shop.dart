import 'package:flutter/cupertino.dart';

import 'food.dart';

class Shop extends ChangeNotifier{
  final List<Food> _foodMenu=[
    //Cookie
    Food(name: 'Choc-Cookie', price: '200', rating: '4.8', imagePath: 'assets/images/cookies.png' ),
    //Donut
    Food(name: 'Strawberry Donut', price: '300', rating: '4.5', imagePath: 'assets/images/doughnut.png' ),
    //Pastry
    Food(name: 'Pastry', price: '350', rating: '5', imagePath: 'assets/images/pastry.png' ),
    //IceCream
    Food(name: 'Ice-cream', price: '450', rating: '4.7', imagePath: 'assets/images/ice-cream.png' )
  ];

  List<Food> _cart=[

  ];


  //getter method
 List<Food> get foodMenu => _foodMenu;
 List<Food> get cart =>_cart;

 //add to cart

void addToCart(Food foodItem, int itemQuantity){
    for(int i=0; i<itemQuantity; i++){
       _cart.add(foodItem);
    }
    notifyListeners();
}

//remove from cart
void removeCart(Food food){
  _cart.remove(food);
  notifyListeners();
}

//for adding the items in
  int getTotalPrice() {
    int total = 0;
    for (var food in _cart) {
      total += int.parse(food.price); // Assuming price is a string, convert it to int
    }
    return total;
  }



}