import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shop/constants/colors.dart';
import 'package:shop/screens/category_screen.dart';
import 'package:shop/screens/home_screen.dart';
import 'package:shop/screens/product_list_screen.dart';
import 'package:shop/screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedBottomNavigationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: IndexedStack(
          index: selectedBottomNavigationIndex,
          children: getScreen(),
        ),
        bottomNavigationBar: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: BottomNavigationBar(
              onTap: (int index) {
                setState(() {
                  selectedBottomNavigationIndex = index;
                });
              },
              selectedLabelStyle: TextStyle(
                  fontFamily: "SB", fontSize: 10, color: ColorApp.blue),
              unselectedLabelStyle: TextStyle(
                  fontFamily: "SB", fontSize: 10, color: Colors.black),
              type: BottomNavigationBarType.fixed,
              currentIndex: selectedBottomNavigationIndex,
              backgroundColor: Colors.transparent,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Image.asset("assets/images/icon_profile.png"),
                    ),
                    label: "حساب کاربری",
                    activeIcon: Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Container(
                        child: Image.asset(
                            "assets/images/icon_profile_active.png"),
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: ColorApp.blue,
                            blurRadius: 20,
                            spreadRadius: -7,
                            offset: Offset(0.0, 13),
                          )
                        ]),
                      ),
                    )),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Image.asset("assets/images/icon_basket.png"),
                    ),
                    label: "سبد خرید",
                    activeIcon: Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Container(
                        child:
                            Image.asset("assets/images/icon_basket_active.png"),
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: ColorApp.blue,
                            blurRadius: 20,
                            spreadRadius: -7,
                            offset: Offset(0.0, 13),
                          )
                        ]),
                      ),
                    )),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Image.asset("assets/images/icon_category.png"),
                    ),
                    label: "دسته بندی",
                    activeIcon: Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Container(
                        child: Image.asset(
                            "assets/images/icon_category_active.png"),
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: ColorApp.blue,
                            blurRadius: 20,
                            spreadRadius: -7,
                            offset: Offset(0.0, 13),
                          )
                        ]),
                      ),
                    )),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Image.asset("assets/images/icon_home.png"),
                    ),
                    label: "خانه",
                    activeIcon: Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Container(
                        child:
                            Image.asset("assets/images/icon_home_active.png"),
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: ColorApp.blue,
                            blurRadius: 20,
                            spreadRadius: -7,
                            offset: Offset(0.0, 13),
                          )
                        ]),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getScreen() {
    return <Widget>[
      ProfileScreen(),
      CategoryScreen(),
      ProductListScreen(),
      HomeScreen(),
    ];
  }
}
