// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/constants/colors.dart';
import 'package:task/providers/categories_provider.dart';
import 'package:task/providers/products_provider.dart';
import 'package:task/utils/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<Color> blogColors = [
    primaryColor.withOpacity(0.2),
    accentColor.withOpacity(0.2),
    Colors.amber.withOpacity(0.2),
    Colors.green.withOpacity(0.2),
    Colors.blue.withOpacity(0.2),
    Colors.purple.withOpacity(0.2),
    Colors.pink.withOpacity(0.2),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final provider =
            Provider.of<CategoriesProvider>(context, listen: false);
        provider.getCategories();
      },
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final provider = Provider.of<ProductsProvider>(context, listen: false);
        provider.getProducts();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: blueColor,
        title: Text(
          "Home Screen",
          style: normalWhiteTextStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            CarouselSlider(
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                height: 270.h,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0.w),
                        decoration: BoxDecoration(
                          color: blogColors[i - 1],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Stack(
                          children: [
                            Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                height: 270.h,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/Blogg$i.jpg",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 6.h),
                                  child: Text(
                                    "View All",
                                    style: normalWhiteTextStyle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [1, 2, 3, 4, 5].map((i) {
                int index = i - 1;
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              }).toList(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Collections",
                    style: normalHeadingTextStyle,
                  ),
                  Text(
                    "View All",
                    style: orangeTextStyle,
                  ),
                ],
              ),
            ),
            Consumer<CategoriesProvider>(
              builder: (context, provider, _) {
                return provider.isloading
                    ? Container(
                        child: SizedBox(
                          height: 40.h,
                          width: 200.w,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: primaryColor,
                            ),
                          ),
                        ),
                      )
                    : provider.categories!.length == 0
                        ? Container(
                            child: Text(
                              "Currently There are no datas of the categories",
                              style: normalTextStyle,
                            ),
                          )
                        : SizedBox(
                            height: 142.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: provider.categories!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 90.w,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 5.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                          "assets/images/blog${index + 1}.jpg",
                                        ),
                                        radius: 30,
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        provider.categories![index],
                                        style: smallTextStyle,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Products",
                    style: normalBlueTextStyle,
                  ),
                  Text(
                    "View All",
                    style: orangeTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
