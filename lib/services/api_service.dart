import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future getAllPosts() async {
    final allProductUrl = Uri.parse('https://fakestoreapi.com/products');
    final response = await http.get(allProductUrl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  static Future getSingleProduct(int id) async {
    final singleProductUrl = Uri.parse('https://fakestoreapi.com/products/$id');
    final response = await http.get(singleProductUrl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  static Future getAllCategory() async {
    final allCategoryUrl =
        Uri.parse('https://fakestoreapi.com/products/categories');
    final response = await http.get(allCategoryUrl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  static Future getProductByCategory(String catName) async {
    final fetchProductCategoryUrl =
        Uri.parse('https://fakestoreapi.com/products/category/$catName');
    final response = await http.get(fetchProductCategoryUrl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }
}
