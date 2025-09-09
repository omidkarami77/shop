import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop/bloc/basket/bloc/basket_bloc.dart';

import 'package:shop/constants/colors.dart';
import 'package:shop/data/model/basket_item.dart';
import 'package:shop/util/extentions/string_extentions.dart';
import 'package:shop/widgets/catched_image.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:app_links/app_links.dart';
import 'package:zarinpal/zarinpal.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  PaymentRequest paymentRequest = PaymentRequest();

  @override
  void initState() {
    super.initState();

    paymentRequest.setIsSandBox(true);
    paymentRequest.setAmount(100000);
    paymentRequest.setDescription("خرید محصول از فروشگاه اپل");
    paymentRequest.setCallbackURL("expertflutter://shop");

    final appLinks = AppLinks();
    appLinks.stringLinkStream.listen((String? link) {
      if (link != null && link.contains('expertflutter://shop')) {
        Uri uri = Uri.parse(link);
        String? status = uri.queryParameters['status'];
        String? authority = uri.queryParameters['authority'];

        if (status == '100') {
        } else {}
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<BasketBloc, BasketState>(
        builder: (context, state) {
          return Stack(
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
                  if (state is BasketDataFetchedState) ...[
                    state.items.fold(
                      (l) => SliverToBoxAdapter(
                        child: Center(child: Text("خطا در بارگذاری اطلاعات")),
                      ),
                      (basketItemList) {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            return CardItem(basketItemList[index]);
                          }, childCount: basketItemList.length),
                        );
                      },
                    ),
                  ] else ...[
                    SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ],
                  SliverPadding(padding: EdgeInsets.only(bottom: 50)),
                ],
              ),
              if (state is BasketDataFetchedState) ...[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 44,
                    right: 44,
                    bottom: 20,
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      ZarinPal().startPayment(paymentRequest, (
                        int? status,
                        String? paymentGateWayUri,
                        Map<String, dynamic>? data,
                      ) {
                        if (status == 100 && paymentGateWayUri != null) {
                          launchUrl(
                            Uri.parse(paymentGateWayUri),
                            mode: LaunchMode.externalApplication,
                          );
                        } else {}
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          ColorApplication.green, // رنگ پس‌زمینه دکمه
                      minimumSize: Size(
                        MediaQuery.of(context).size.width,
                        53,
                      ), // عرض و ارتفاع دکمه
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ), // فاصله داخلی
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ), // گرد کردن گوشه‌ها
                      ),
                    ),
                    child: Text(
                      "${state.basketFinalPrice} تومان پرداخت",
                      style: TextStyle(
                        fontFamily: "SB",
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final BasketItem basketItem;
  const CardItem(this.basketItem, {super.key});

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
                            basketItem.name,
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

                        SizedBox(height: 10),
                        Wrap(
                          spacing: 8,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.red, width: 1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 2,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset("assets/images/icon_trash.png"),
                                    SizedBox(width: 8),
                                    Text(
                                      "حذف",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            OptionsChip(title: "امید کرمی", color: '4287f5'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                    height: 104,
                    width: 75,
                    child: CachedImage(imageUrl: basketItem.thumbnail),
                  ),
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
                  basketItem.realPrice == 0
                      ? "محصولی در سبد وجود ندارد"
                      : basketItem.realPrice.toString(),
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
  final String? color;
  final String title;
  const OptionsChip({super.key, required this.color, required this.title});

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
            SizedBox(width: 10),
            if (color!.isNotEmpty) ...[
              Container(
                width: 12,
                height: 12,
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  color: color!.parseToColor(),
                ),
              ),
            ],

            Text(title),
          ],
        ),
      ),
    );
  }
}
