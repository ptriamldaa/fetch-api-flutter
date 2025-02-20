import 'package:flutter/material.dart';
import 'package:flutter_app/screens/products/product_list_screen.dart';


void main(){
  runApp(const MainApp());
}

class MainApp extends StatelessWidget{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
          body: ProductListScreen()
        ),
    );
  }
}