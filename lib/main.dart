import 'package:dessertapp/models/shop.dart';
import 'package:dessertapp/pages/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
ChangeNotifierProvider(
create: (context)=> Shop(),
  child:const MyApp(),
),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dessert App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyMainPage(),
    );
  }
}

