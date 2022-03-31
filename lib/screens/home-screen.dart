// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:homedesign/custom/BorderIcon.dart';
import 'package:homedesign/sample_data.dart';
import 'package:homedesign/screens/landing_screen.dart';
import 'package:homedesign/utils/constants.dart';
import 'package:homedesign/utils/widget_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return Scaffold(
        backgroundColor: Color(0xffF6F6F6),
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(55),
                  Padding(
                    padding: sidePadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BorderIcon(
                          child: Icon(
                            Icons.menu,
                            color: COLOR_BLACK,
                          ),
                        ),
                        Text(
                          'Home',
                          style: themeData.textTheme.headline1!
                              .copyWith(color: Color(0xff6F7789)),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 29,
                          child: CircleAvatar(
                            radius: 24,
                            backgroundImage:
                                AssetImage('assets/images/pp.jpeg'),
                            child: Stack(children: [
                              Align(
                                alignment: Alignment(-1.95, -1.57),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 14,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.notifications_active,
                                      color: Color(0xffEE684A),
                                      size: 13,
                                    ),
                                  ),
                                ),
                              )
                            ]),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: sidePadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        addVerticalSpace(42.71),
                        Text(
                          'Wonderful Kashmir',
                          style: themeData.textTheme.headline1!.copyWith(
                              color: Colors.black, fontWeight: FontWeight.w900),
                        ),
                        addVerticalSpace(10),
                        Text(
                          "Let's Explore Together",
                          style: themeData.textTheme.headlineLarge!.copyWith(
                              fontSize: 21, fontWeight: FontWeight.w700),
                        ),
                        addVerticalSpace(31),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: ['All', 'Popular', 'Nearby', 'Recommended']
                          .map((filter) => ChoiceOption(text: filter))
                          .toList(),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: sidePadding,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: BEAUTY_DATA.length,
                          itemBuilder: (context, index) {
                            return BeautifulPlaces(
                              itemData: BEAUTY_DATA[index],
                            );
                          }),
                    ),
                  ),
                  addVerticalSpace(8),
                  Padding(
                    padding: sidePadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Top Place',
                          style: themeData.textTheme.headline2,
                        ),
                        Text(
                          'View All',
                          style: themeData.textTheme.headline5,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: ListView.builder(
                          reverse: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: BEAUTY_DATA.length,
                          itemBuilder: (context, index) {
                            return BeautifulPlacesTile(
                              itemData: BEAUTY_DATA[index],
                            );
                          }),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    height: 70,
                    width: size.width * 0.87,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        addHorizontalSpace(65),
                        Column(
                          children: [
                            addVerticalSpace(22),
                            Icon(
                              Icons.home,
                              color: Colors.white,
                            ),
                            addVerticalSpace(2),
                            Container(
                              color: Colors.white,
                              height: 4,
                              width: 14,
                            )
                          ],
                        ),
                        addHorizontalSpace(40),
                        Icon(
                          Icons.pin_drop_rounded,
                          color: Colors.white,
                        ),
                        addHorizontalSpace(40),
                        Icon(
                          Icons.message_rounded,
                          color: Colors.white,
                        ),
                        addHorizontalSpace(40),
                        Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class BeautifulPlaces extends StatelessWidget {
  dynamic itemData;
  BeautifulPlaces({
    Key? key,
    required this.itemData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    const double pading = 25;
    const double sidePadding = pading;

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    clipBehavior: Clip.antiAlias,
                    child: SizedBox(
                        width: size.width * 0.55,
                        // height: size.height * 0.12,
                        child: Image.asset(
                          itemData['image'],
                          height: 138,
                          fit: BoxFit.fill,
                        )),
                  ),
                  addVerticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          itemData['name'],
                          style: themeData.textTheme.headline3,
                        ),
                      ),
                      addHorizontalSpace(20),
                      Icon(
                        Icons.star,
                        color: Color(0xffEE684A),
                        size: 16,
                      ),
                      Text(itemData['rating'].toString())
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.pin_drop_rounded,
                          color: Color(0xffEE684A),
                          size: 20,
                        ),
                      ),
                      Text(itemData['place'])
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BeautifulPlacesTile extends StatelessWidget {
  dynamic itemData;
  BeautifulPlacesTile({
    Key? key,
    required this.itemData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    const double pading = 25;
    const double sidePadding = pading;

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(top: 8),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                    width: size.width * 0.33,
                    // height: size.height * 0.20,
                    child: Image.asset(
                      itemData['image'],
                      height: 90,
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      itemData['name'],
                      style: themeData.textTheme.headline3,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.pin_drop_rounded,
                          color: Color(0xffEE684A),
                          size: 20,
                        ),
                      ),
                      Text(itemData['place'])
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      addHorizontalSpace(10),
                      Icon(
                        Icons.star,
                        color: Color(0xffEE684A),
                        size: 16,
                      ),
                      Text(itemData['rating'].toString())
                    ],
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
