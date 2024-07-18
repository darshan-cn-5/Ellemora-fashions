import "dart:convert";

import "package:http/http.dart" as http;
import "package:flutter/material.dart";

class CategoriesProvider extends ChangeNotifier {
  List<dynamic>? _categories;
  bool _isloading = false;

  bool get isloading => _isloading;

  set isloading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  List<dynamic>? get categories => _categories;

  set categories(List<dynamic>? categories) {
    _categories = categories;
    notifyListeners();
  }

  Future<void> getCategories() async {
    isloading = true;
    try {
      final response = await http
          .get(Uri.parse('https://fakestoreapi.com/products/categories'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        categories = data;
        print("successfully got the categories");
        print("categories data is $categories");
      } else {
        print('Failed to load categories and the error is ${response.body}');
      }
    } catch (err) {
      print('Catch Error: $err');
    } finally {
      isloading = false;
    }
  }
}
