import 'package:api_tutorial_udemy/screens/product_detail.dart';
import 'package:api_tutorial_udemy/services/api_service.dart';
import 'package:flutter/material.dart';

class CategoryProductScreen extends StatelessWidget {
  const CategoryProductScreen({
    Key? key,
    required this.categoryName,
  }) : super(key: key);
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName.toUpperCase()),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: ApiService.getProductByCategory(categoryName),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data[index]['title']),
                    leading: Image.network(
                      snapshot.data[index]['image'],
                      height: 50,
                      width: 30,
                    ),
                    subtitle: Text(
                        'Price - \$${snapshot.data[index]['price'].toString()}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetail(id: snapshot.data[index]['id']),
                        ),
                      );
                    },
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
