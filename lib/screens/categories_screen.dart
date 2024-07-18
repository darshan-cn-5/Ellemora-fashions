import 'package:flutter/material.dart';
import 'package:task/constants/colors.dart';
import 'package:task/utils/text_styles.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: blueColor,
        title: Text(
          "Categories Screen",
          style: normalWhiteTextStyle,
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Text(
          "Categories Screen",
          style: normalTextStyle,
        ),
      ),
    );
  }
}
