import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailDynamicListScreen extends StatelessWidget{
  final String itemName;
  final String category;
  final double price;
  final String description;
  final String image;

  DetailDynamicListScreen({super.key,
    required this.itemName,
    required this.category,
    required this.price,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Product'),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Center(
            child: Image.network(
              image,
              height: 300,
              width: 300,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            category,
            style: TextStyle(fontSize: 12, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          Text(
            itemName,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            '\$${price.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.green),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}