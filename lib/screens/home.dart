import 'package:api_tutorial_udemy/screens/product_detail_screen.dart';
import 'package:api_tutorial_udemy/services/api_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder(
        future: ApiService().getAllPosts(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Center(
                child: ListView.builder(
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
                                  builder: (context) => ProductDetail(
                                      id: snapshot.data[index]['id'])));
                        },
                      );
                    }));
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
