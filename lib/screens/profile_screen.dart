import 'package:flutter/material.dart';
import 'package:task/constants/colors.dart';
import 'package:task/utils/text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: blueColor,
        title: Text(
          "Profile Screen",
          style: normalWhiteTextStyle,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text(
          "Profile Screen",
          style: normalTextStyle,
        ),
      ),
    );
  }
}
