import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/constants/colors.dart';
import 'package:task/providers/products_provider.dart';
import 'package:task/utils/text_styles.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final provider = Provider.of<ProductsProvider>(context, listen: false);
        provider.getProducts();
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: blueColor,
        title: Text(
          "Products",
          style: normalWhiteTextStyle,
        ),
        centerTitle: true,
      ),
    );
  }
}
