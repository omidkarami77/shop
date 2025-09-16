import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shop/bloc/authentication/auth_bloc.dart';

import 'package:shop/data/model/basket_item.dart';
import 'package:shop/dr.dart';

import 'package:shop/screens/dashbord_screen.dart';

import 'package:shop/screens/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/util/auth_manager.dart';

GlobalKey<NavigatorState> globalNavigationKey = GlobalKey<NavigatorState>();

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
      navigatorKey: globalNavigationKey,
      debugShowCheckedModeBanner: false,

      home: (AuthManager.readAuth().isEmpty)
          ? BlocProvider(
              create: ((context) => AuthBloc()),
              child: LoginScreen(),
            )
          : DashBoordScreen(),
    );
  }
}
/*
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
*/