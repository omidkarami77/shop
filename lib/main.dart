import 'package:flutter/material.dart';
import 'package:shop/constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: ColorApp.backgroundScreenColor,
        body: SafeArea(
            child: Center(
          child: Container(
            width: 160,
            height: 216,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Expanded(child: Container()),
                  Image.asset("assets/images/iphone.png"),
                  Positioned(
                    top: 0,
                    right: 10,
                    child: SizedBox(
                        width: 24,
                        height: 24,
                        child: Image.asset(
                            "assets/images/active_fav_product.png")),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                        child: Text(
                          "%3",
                          style: TextStyle(
                              fontFamily: "SB",
                              fontSize: 12,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Text(
                      "آیفون 13 پرو مکس",
                      style: TextStyle(fontSize: 14, fontFamily: "SM"),
                    ),
                  ),
                  Container(
                    height: 53,
                    width: 160,
                    decoration: const BoxDecoration(
                      color: ColorApp.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: ColorApp.blue,
                            blurRadius: 25,
                            spreadRadius: -12,
                            offset: Offset(0.0, 15))
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(mainAxisSize: MainAxisSize.max, children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            "تومان",
                            style: TextStyle(
                                fontFamily: "SM",
                                fontSize: 12,
                                color: Colors.white),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "49.800.000",
                              style: TextStyle(
                                  fontFamily: "SM",
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 12,
                                  color: Colors.white),
                            ),
                            Text(
                              "48.800.000",
                              style: TextStyle(
                                  fontFamily: "SM",
                                  fontSize: 12,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                            width: 24,
                            height: 20,
                            child: Image.asset(
                                "assets/images/icon_right_arrow_cricle.png"))
                      ]),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        )),
      ),
    );
  }
}

// ignore: camel_case_types
class categoryHorizontalItemList extends StatelessWidget {
  const categoryHorizontalItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              height: 56,
              width: 56,
              decoration: ShapeDecoration(
                  color: Colors.red,
                  shadows: const [
                    BoxShadow(
                      color: Colors.red,
                      blurRadius: 25,
                      spreadRadius: -14,
                      offset: Offset(0.0, 15),
                    ),
                  ],
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(40))),
            ),
            const Icon(
              Icons.mouse,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "hello",
          style: TextStyle(fontFamily: 'SB', fontSize: 12),
        )
      ],
    );
  }
}
