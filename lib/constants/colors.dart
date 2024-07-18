import 'package:flutter/material.dart';

Color primaryColor = "#8870E6".toColor();
Color accentColor = "#8870E6".toColor();
Color lightAccentColor = "#F1EDFF".toColor();
Color skipColor = "#7B7681".toColor();
Color fillColor = "#F6F6FA".toColor();
Color redColor = "#DD3333".toColor();
Color blackColor = Colors.black;
Color whiteColor = Colors.white;
Color gradientFirst = "#F1EEFF".toColor();
Color gradientSecond = "#FFFFFF".toColor();
Color checkBox = "#B5B1B9".toColor();
Color greyFontColor = "#7B7681".toColor();
Color speBackColor = "#FFD6D6".toColor();
Color greenColor = "#4CAF50".toColor();
Color blueColor = "#2196F3".toColor();
Color yellowColor = "#FFEB3B".toColor();
Color orangeColor = "#FF9800".toColor();
Color purpleColor = "#9C27B0".toColor();
Color tealColor = "#009688".toColor();
Color pinkColor = "#E91E63".toColor();
Color limeColor = "#CDDC39".toColor();
Color amberColor = "#FFC107".toColor();
Color cyanColor = "#00BCD4".toColor();
Color indigoColor = "#3F51B5".toColor();
Color brownColor = "#795548".toColor();
Color lightBlueColor = "#03A9F4".toColor();
Color deepOrangeColor = "#FF5722".toColor();
Color lightGreenColor = "#8BC34A".toColor();

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}