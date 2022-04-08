// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:homedesign/custom/BorderIcon.dart';
import 'package:homedesign/sample_data.dart';
import 'package:homedesign/screens/detail-travel.dart';
import 'package:homedesign/utils/constants.dart';
import 'package:homedesign/utils/widget_functions.dart';

class Practice extends StatefulWidget {
  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    const double padding = 25;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);

    return Scaffold(backgroundColor: Color(0xffF6F6F6), body: HideContainer());
  }
}

class HideContainer extends StatefulWidget {
  @override
  State<HideContainer> createState() => _HideContainerState();
}

class _HideContainerState extends State<HideContainer> {
  ScrollController controller = ScrollController();
  bool closeAboveContainer = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
        closeAboveContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    const double padding = 25;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: size.width,
            alignment: Alignment.topCenter,
            height: closeAboveContainer ? 0 : size.height * 0.22,
            child: HideAboveConatiner()),
        addVerticalSpace(40),
        Padding(
          padding: sidePadding,
          child: Text(
            "Category",
            style: themeData.textTheme.headline2!
                .copyWith(fontWeight: FontWeight.w800),
          ),
        ),
        addVerticalSpace(20),
        SizedBox(
          height: 120,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: CATEGORY.length,
              itemBuilder: (context, index) {
                return Category(itemData: CATEGORY[index]);
              }),
        ),
        Padding(
          padding: sidePadding,
          child: Text(
            "Recommend",
            style: themeData.textTheme.headline2!
                .copyWith(fontWeight: FontWeight.w800),
          ),
        ),
        addVerticalSpace(18),
        Expanded(
          child: GridView.builder(
              controller: controller,
              shrinkWrap: true,
              itemCount: BEAUTY_DATA.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 2.1,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Recommend(
                    itemData: BEAUTY_DATA[index],
                  ),
                );
              }),
        ),
        addVerticalSpace(8),
      ],
    );
  }
}

class HideAboveConatiner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    const double padding = 25;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return Container(
      child: FittedBox(
        fit: BoxFit.fill,
        alignment: Alignment.topCenter,
        child: Column(
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
                  )),
                  addHorizontalSpace(100),
                  Text(
                    'Search',
                    style: themeData.textTheme.headline1!
                        .copyWith(color: Color(0xff6F7789)),
                  ),
                  addHorizontalSpace(100),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 29,
                    child: CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage('assets/images/pp.jpeg'),
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
                  ),
                ],
              ),
            ),
            addVerticalSpace(40),
            Padding(
              padding: sidePadding,
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      label: Text(
                        '  Search',
                        style: themeData.textTheme.bodyMedium!
                            .copyWith(fontSize: 16),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: padding),
                        child: Icon(
                          Icons.search,
                          size: 30,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 5),
                          borderRadius: BorderRadius.circular(20)),
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      hoverColor: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Recommend extends StatelessWidget {
  final dynamic itemData;
  const Recommend({Key? key, this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailTravel(itemData: itemData)));
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 25),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            width: size.width * 0.60,
            height: size.height * 0.23,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        itemData['image'],
                        fit: BoxFit.fill,
                        width: size.width * 0.60,
                        height: size.height * 0.13,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        itemData['name'],
                        style: themeData.textTheme.headline5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 16,
                            color: Color(0xffEE684A),
                          ),
                          Text(itemData['rating'].toString()),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.pin_drop,
                        size: 16,
                        color: Color(0xffEE684A),
                      ),
                      Text(itemData['place']),
                    ],
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

class Category extends StatelessWidget {
  final dynamic itemData;

  const Category({
    Key? key,
    required this.itemData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(itemData['image']),
            radius: 32,
          ),
          addVerticalSpace(12),
          Text(
            itemData['name'],
            style: themeData.textTheme.headline5,
          ),
        ],
      ),
    );
  }
}
