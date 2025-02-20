import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/products.dart';
import 'package:flutter_app/screens/detail_dynamic_list_screen.dart';
import 'package:flutter_app/services/api_service.dart';

class ProductListScreen extends StatefulWidget{
  const ProductListScreen({super.key});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late Future<List<Products>> _futureProducts;

  @override
  void initState(){
    _futureProducts = ApiService().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Product"),
      ),
      body: FutureBuilder<List<Products>>(
          future: _futureProducts,
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text('No Data'),
              );

            } else {
              List<Products> products = snapshot.data!;
              return ListView.builder(
                itemCount: products.length,
                  itemBuilder: (context, index) {
                  Products product = products[index];
                  return ListTile(
                    leading: Image.network(
                      product.image,
                      height: 50,
                      width: 50,
                    ),
                    title: Text(product.title),
                    subtitle: Text(product.category),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DetailDynamicListScreen(
                                itemName: product.title,
                                price: product.price,
                                description: product.description,
                                category: product.category,
                                image: product.image,
                              ),
                        ),
                      );
                    },
                  );
                  }
              );
            }
          },
      ),
    );
  }
}