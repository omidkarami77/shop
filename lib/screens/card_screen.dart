import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shop/constants/colors.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundScreenColor,
      body: SafeArea(
          child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 44, right: 44, bottom: 32, top: 20),
                child: Container(
                  height: 46,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Row(children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: SizedBox(
                              width: 22,
                              height: 26,
                              child: Image.asset(
                                  "assets/images/icon_apple_blue.png"))),
                      const Expanded(
                        child: Text(
                          "سبد خرید",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "SB",
                            color: ColorApp.blue,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return CardItem();
              }, childCount: 10),
            ),
            SliverPadding(padding: EdgeInsets.only(bottom: 80))
          ]),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 44, vertical: 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 53,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorApp.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {},
                child: Text(
                  "ادامه فرآیند خرید",
                  style: TextStyle(fontSize: 18, fontFamily: 'sm'),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 44, right: 44, bottom: 20),
      height: 249,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("1"),
                        Text("1"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 8),
                                child: Text(
                                  "%3",
                                  style: TextStyle(
                                      fontFamily: "SB",
                                      fontSize: 12,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Text("تومان"),
                            Text("1444004.444")
                          ],
                        ),
                        Wrap(
                          children: [
                            OptionCheap(),
                            OptionCheap(),
                            OptionCheap(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Image.asset("assets/images/iphone.png"),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DottedLine(
              lineThickness: 3,
              dashLength: 8,
              dashColor: ColorApp.grey.withOpacity(0.5),
              dashGapLength: 3,
              dashGapColor: Colors.transparent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("5985550"),
                SizedBox(
                  width: 5,
                ),
                Text("تومان")
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OptionCheap extends StatelessWidget {
  const OptionCheap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorApp.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/bala_paeein.png"),
              Text("111111"),
            ],
          )),
    );
  }
}
