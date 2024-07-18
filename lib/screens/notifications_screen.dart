import 'package:flutter/material.dart';
import 'package:task/constants/colors.dart';
import 'package:task/utils/text_styles.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: blueColor,
        title: Text(
          "Notifications Screen",
          style: normalWhiteTextStyle,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Notifications Screen",
          style: normalTextStyle,
        ),
      ),
    );
  }
}
