import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import 'package:shop/constants/colors.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsetsGeometry.only(
                    left: 44,
                    right: 44,
                    bottom: 32,
                  ),
                  child: Container(
                    height: 46,
                    width: 340,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 15,
                          spreadRadius: -5,
                          offset: Offset(0, 15),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/icon_apple_blue.png",
                            height: 25,
                            width: 25,
                          ),

                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              "سبد خرید",
                              style: TextStyle(
                                fontSize: 16,
                                color: ColorApplication.blueIndicator,
                                fontFamily: "SB",
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return CardItem();
                }, childCount: 10),
              ),
              SliverPadding(padding: EdgeInsets.only(bottom: 50)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 44, right: 44, bottom: 20),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorApplication.green, // رنگ پس‌زمینه دکمه
                minimumSize: Size(
                  MediaQuery.of(context).size.width,
                  53,
                ), // عرض و ارتفاع دکمه
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ), // فاصله داخلی
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // گرد کردن گوشه‌ها
                ),
              ),
              child: Text(
                "ادامه فرآیند خرید",
                style: TextStyle(
                  fontFamily: "SB",
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 44, right: 44, bottom: 20),
      height: 239,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            // سایه ملایم و روشن
            blurRadius: 20, // نرم بودن سایه
            spreadRadius: 5, // پخش شدن سایه
            offset: Offset(0, 8), // جابجایی سایه به پایین
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            overflow: TextOverflow
                                .ellipsis, // اینجا سه نقطه فعال میشه

                            textAlign: TextAlign.right,
                            "آیفون 13 پرو مکس دو سیم کارت",
                            style: TextStyle(
                              fontFamily: "SB",
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "گارانتی 18 ماهه مدیا پردازش",
                          style: TextStyle(
                            fontFamily: "SB",
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 25,
                              height: 16,
                              decoration: BoxDecoration(
                                color: ColorApplication.red,
                                borderRadius: BorderRadius.circular(8),
                              ),

                              child: Center(
                                child: Text(
                                  "%3",
                                  style: TextStyle(
                                    fontFamily: "SB",
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "تومان",
                              style: TextStyle(
                                fontFamily: "SM",
                                fontSize: 10,
                                color: ColorApplication.grey,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              " 46,000,000",
                              style: TextStyle(
                                fontFamily: "SM",
                                fontSize: 12,
                                color: ColorApplication.grey,
                              ),
                            ),
                          ],
                        ),
                        Wrap(
                          children: [
                            OptionsChip(),
                            SizedBox(width: 10),
                            OptionsChip(),
                            SizedBox(width: 10),
                            OptionsChip(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset("assets/images/iphone.png"),
                ),
              ],
            ),
          ),
          DottedLine(
            dashColor: Color(0xFFEEEEEE),
            lineThickness: 3,
            dashLength: 8,
            dashGapLength: 3,
            dashGapColor: Colors.transparent,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("تومان", style: TextStyle(fontFamily: "SM", fontSize: 12)),
                SizedBox(width: 5),
                Text(
                  "45,350,000",
                  style: TextStyle(fontFamily: "SM", fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OptionsChip extends StatelessWidget {
  const OptionsChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xffE5E5E5), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/icon_options.png"),
            SizedBox(width: 10),
            Text("1111"),
          ],
        ),
      ),
    );
  }
}
