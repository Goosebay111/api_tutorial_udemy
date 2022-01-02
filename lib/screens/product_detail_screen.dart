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
        title: Text('Product Detail'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Scaffold(
          body: FutureBuilder(
            future: ApiService.getSingleProduct(id),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: <Widget>[
                    Image.network(snapshot.data['image']),
                    Text(snapshot.data['title']),
                    Text(snapshot.data['description']),
                    Text(snapshot.data['price'].toString()),
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
