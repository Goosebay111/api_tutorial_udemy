import 'package:api_tutorial_udemy/services/api_service.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Scaffold(
          body: FutureBuilder(
            future: ApiService.getSingleProduct(id),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 30),
                      Image.network(
                        snapshot.data['image'],
                        height: 200,
                        width: double.infinity,
                      ),
                      const SizedBox(height: 20),
                      Center(
                          child: Text(
                        '\$${snapshot.data['price'].toString()}',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      const SizedBox(height: 10),
                      Text(
                        snapshot.data['title'],
                        style: const TextStyle(fontSize: 25),
                      ),
                      Chip(
                          label: Text('${snapshot.data['category'].toString()}',
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white)),
                          backgroundColor: Colors.blueGrey),
                      const SizedBox(height: 10),
                      Text(
                        snapshot.data['description'],
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add_shopping_cart_outlined),
            backgroundColor: Colors.green,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }
}
