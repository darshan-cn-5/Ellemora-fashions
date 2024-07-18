import "package:flutter/material.dart";
import "package:task/models/products.dart";
import "package:http/http.dart" as http;
import "dart:convert";

class ProductsProvider extends ChangeNotifier {
  List<Products> _products = [];

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<Products> get products => _products;

  set products(List<Products> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    isLoading = true;
    notifyListeners(); // Notify listeners to show loading indicator

    try {
      final response = await http.get(
        Uri.parse("https://fakestoreapi.com/products"),
      );

      if (response.statusCode == 200) {
        final List<dynamic> productsData = json.decode(response.body);
        products = productsData.map((data) => Products.fromJson(data)).toList();

        print("Successfully got the data of the products");
      } else {
        print("Error occurred while fetching the data of the products");
        print(
            "Error status code is ${response.statusCode} and error is ${response.body}");
        throw Exception("Failed to load products");
      }
    } catch (err) {
      print("Catch Error while fetching the products data: $err");
      throw Exception(err);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
