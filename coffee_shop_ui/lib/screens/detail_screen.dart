import 'dart:ui';

import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/theme/app_color.dart';
import 'package:coffee_shop/theme/app_text.dart';
import 'package:coffee_shop/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DetailScreen extends StatefulWidget {
  final Coffee coffee;
  const DetailScreen({super.key, required this.coffee});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Coffee c = widget.coffee;
  Widget buildSize(
      {required String sizeName, required int index, VoidCallback? onTap}) {
    bool isSelected = index == selectedSize;
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 130,
          decoration: BoxDecoration(
            color: isSelected
                ? null
                : Color.lerp(AppColor.first, Colors.white, 0.1)!,
            borderRadius: BorderRadius.circular(10),
            border:
                Border.all(color: isSelected ? AppColor.second : Colors.black),
          ),
          child: Center(
              child: Text(
            sizeName,
            style:
                AppText.xl.copyWith(color: isSelected ? AppColor.second : null),
          )),
        ),
      ),
    );
  }

  int selectedSize = 0;

  void onSizeTap(int i) {
    setState(() {
      selectedSize = i;
    });
  }

  List<String> size = [
    'S',
    'M',
    'L',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Stack(
                    children: [
                      // Background image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          c.image,
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Row(
                              children: [
                                CustomButton(
                                  child: Icon(
                                    CupertinoIcons.back,
                                  ),
                                  color: AppColor.first,
                                  height: 50,
                                  width: 50,
                                  onTap: ()=> Navigator.pop(context),
                                ),
                                const Spacer(),
                                CustomButton(
                                  child: Icon(CupertinoIcons.heart_fill),
                                  color: AppColor.first,
                                  height: 50,
                                  width: 50,
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Expanded(
                              child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                                // blur effect
                                child: Container(
                                    margin: EdgeInsets.all(20),
                                    // light tint
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                c.name,
                                                style: AppText.xl,
                                              ),
                                              Text(
                                                c.details,
                                                style: AppText.small,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            spacing: 10,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                children: [
                                                  CustomButton(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.coffee,
                                                          color: AppColor.second,
                                                        ),
                                                        Text('Coffee')
                                                      ],
                                                    ),
                                                    color: AppColor.first,
                                                    height: 60,
                                                    width: 60,
                                                  ),
                                                  CustomButton(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .emoji_food_beverage,
                                                          color: AppColor.second,
                                                        ),
                                                        Text('Milk')
                                                      ],
                                                    ),
                                                    color: AppColor.first,
                                                    height: 60,
                                                    width: 60,
                                                  ),
                                                ],
                                              ),
                                              CustomButton(
                                                child: Center(
                                                    child:
                                                        Text('Medium Roasted')),
                                                color: AppColor.first,
                                                width: 150,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            ),
                          ))
                        ],
                      ),
                      // Overlaying element (e.g., back button)
                    ],
                  ),
                ),
                Text('Description',style: AppText.large,),
                ReadMoreText(
                  c.description,
                  trimLines: 2, // number of lines to show before trimming
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' Read more',
                  trimExpandedText: ' Read less',
                  moreStyle: AppText.large.copyWith(color: AppColor.second),
                  lessStyle: AppText.large.copyWith(color: AppColor.second),
                  style: AppText.medium.copyWith(color: Colors.white),
                ),
                Text('Size',style: AppText.large,),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: size.length,
                    itemBuilder: (context, index) {
                      String name = size[index];
                      return buildSize(
                          sizeName: name,
                          index: index,
                          onTap: () => onSizeTap(index));
                    },
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Column(
                      children: [
                        Text('Price'),
                        Row(spacing: 4,
                          children: [
                            Text(
                              '\$',
                              style: AppText.xl.copyWith(color: AppColor.second),
                            ),
                            Text(
                              c.price,
                              style: AppText.large,
                            ),
                          ],
                        ),
          
                      ],
                    ),
                    const Spacer(),
                    CustomButton(child: Center(child: Text('Buy Now',style: AppText.xl,)), color: AppColor.second,width: 250,height: 60,radius : 20)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
