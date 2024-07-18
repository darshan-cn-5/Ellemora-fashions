import 'package:flutter/material.dart';
import 'package:task/constants/colors.dart';
import 'package:task/utils/text_styles.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: blueColor,
        title: Text(
          "My Orders",
          style: normalWhiteTextStyle,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "My Orders Screen",
          style: normalTextStyle,
        ),
      ),
    );
  }
}