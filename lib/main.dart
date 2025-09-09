import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shop/bloc/authentication/auth_bloc.dart';
import 'package:shop/bloc/basket/bloc/basket_bloc.dart';
import 'package:shop/bloc/home/home_bloc.dart';
import 'package:shop/bloc/category/bloc/category_bloc.dart';
import 'package:shop/constants/colors.dart';
import 'package:shop/data/model/basket_item.dart';
import 'package:shop/dr.dart';
import 'package:shop/screens/card_screen.dart' hide CardItem;
import 'package:shop/screens/category_screen.dart';
import 'package:shop/screens/home_screen.dart';
import 'package:shop/screens/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BasketItemAdapter());
  await Hive.openBox<BasketItem>('basket_items');

  // Initialize dependency injection
  await getItInit();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedBottomNavigationIndex = 3;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: ColorApplication.backgroundScreenColor,

        body: IndexedStack(
          index: selectedBottomNavigationIndex,
          children: getScreens(),
        ),
        /*    body: BlocProvider(
          create: (context) => AuthBloc(),
          child: LoginScreen(),
        ), */
        bottomNavigationBar: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),

            child: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  selectedBottomNavigationIndex = index;
                });
              },
              currentIndex: selectedBottomNavigationIndex,
              selectedLabelStyle: TextStyle(
                fontFamily: 'SB',
                fontSize: 12,
                color: ColorApplication
                    .blueIndicator, // این فقط روی متن اعمال میشه، نه آیکون
              ),
              unselectedLabelStyle: TextStyle(
                fontFamily: 'SB',
                fontSize: 12,
                color: Colors.black,
              ),
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,

              items: [
                BottomNavigationBarItem(
                  label: 'حساب کاربری',

                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5, top: 10),
                    child: Image.asset('assets/images/icon_profile.png'),
                  ),
                  activeIcon: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: ColorApplication.blueIndicator,
                          blurRadius: 20,
                          spreadRadius: -15,
                          offset: Offset(0, 13),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5, top: 10),
                      child: Image.asset(
                        'assets/images/icon_profile_active.png',
                      ),
                    ),
                  ),
                ),

                BottomNavigationBarItem(
                  label: 'سبد خرید',

                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5, top: 10),
                    child: Image.asset('assets/images/icon_basket.png'),
                  ),
                  activeIcon: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: ColorApplication.blueIndicator,
                          blurRadius: 20,
                          spreadRadius: -15,
                          offset: Offset(0, 13),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset('assets/images/icon_basket_active.png'),
                  ),
                ),

                BottomNavigationBarItem(
                  label: 'دسته بندی',

                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5, top: 10),
                    child: Image.asset('assets/images/icon_category.png'),
                  ),
                  activeIcon: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: ColorApplication.blueIndicator,
                          blurRadius: 20,
                          spreadRadius: -15,
                          offset: Offset(0, 13),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/images/icon_category_active.png',
                    ),
                  ),
                ),

                BottomNavigationBarItem(
                  label: 'خانه',

                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5, top: 10),
                    child: Image.asset('assets/images/icon_home.png'),
                  ),
                  activeIcon: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: ColorApplication.blueIndicator,
                          blurRadius: 20,
                          spreadRadius: -15,
                          offset: Offset(0, 13),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset('assets/images/icon_home_active.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> getScreens() {
  return [
    BlocProvider(create: (context) => AuthBloc(), child: LoginScreen()),
    BlocProvider(
      create: (context) {
        final bloc = locator.get<BasketBloc>();
        bloc.add(BasketFetchFromHiveEvent());
        return bloc;
      },
      child: CardScreen(),
    ),

    BlocProvider(create: (context) => CategoryBloc(), child: CategoryScreen()),
    Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) {
          var bloc = HomeBloc();
          bloc.add(HomeGetInitializeData());
          return bloc;
        },
        child: HomeScreen(),
      ),
    ),
  ];
}
