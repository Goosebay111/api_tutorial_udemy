import 'package:api_tutorial_udemy/services/api_service.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder(
        future: ApiService.getCart('1'),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List products = snapshot.data['products'];
            return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return FutureBuilder(
                      future: ApiService.getSingleProduct(
                          products[index]['productId']),
                      builder: (context, AsyncSnapshot asyncSnapshot) {
                        if (asyncSnapshot.hasData) {
                          return ListTile(
                              title: Text(asyncSnapshot.data['title']),
                              leading: Image.network(
                                asyncSnapshot.data['image'],
                                height: 40,
                              ),
                              subtitle: Text(
                                  'Quantity: ${products[index]['quantity']}'),
                              trailing: IconButton(
                                onPressed: () async {
                                  await ApiService.deleteCart('1');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Item deleted'),
                                      backgroundColor: Colors.redAccent,
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.redAccent,
                                ),
                              ));
                        } else {
                          return const LinearProgressIndicator();
                        }
                      });
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        color: Colors.green,
        child: const Center(
          child: Text(
            'Order Now',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
