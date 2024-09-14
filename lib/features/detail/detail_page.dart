import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/constants/icons_constants.dart';
import 'package:movie/features/detail/widgets/glass_container.dart';
import 'package:movie/router/app_routes.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
        backgroundColor: MyColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: MyColors.backgroundColor,
          leading: IconButton(
              onPressed: () {
                GoRouter.of(context).go(Routes.home);
              },
              icon: Icon(Icons.arrow_back_ios_rounded),
              color: Colors.white),
          title: Text('Detail', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_outline_outlined, color: Colors.white))],
        ),
        body: Column(children: [
          SizedBox(
            width: width,
            height: height * .4,
            child: Stack(
              children: [
                Container(
                  height: height * .25,
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)), color: Colors.white),
                  child: ClipRRect(
                      child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUFTeN5aG8vYL8pr15XNwQ3nZMpGM1LImz6Q&s', fit: BoxFit.cover, height: height, width: width),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
                ),
                Positioned(
                  top: height * .15,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .07),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                            'https://cdn.marvel.com/content/1x/spider-mannowayhome_lob_crd_03.jpg',
                            height: 200, // Tasvir balandligi
                            width: 150, // Tasvir kengligi
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: MediaQuery.sizeOf(context).width * .03),
                        Text(
                          'Spiderman No Way Home',
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          maxLines: 2,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: height * .2,
                  left: width * .8,
                  child: GlassContainer(
                      child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    width: width * .13,
                    height: height * .03,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(MyIcons.star),
                        Text(
                          '9.5',
                          style: TextStyle(color: MyColors.starColor),
                        )
                      ],
                    ),
                  )),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .07),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(MyIcons.calendar),
                    Text('2021', style: TextStyle(color: MyColors.inactiveIconColor, fontSize: 16)),
                    SvgPicture.asset(MyIcons.divider),
                    SvgPicture.asset(MyIcons.clock),
                    Text('148 minutes', style: TextStyle(color: MyColors.inactiveIconColor, fontSize: 16)),
                    SvgPicture.asset(MyIcons.divider),
                    SvgPicture.asset(MyIcons.ticket),
                    Text('Ation', style: TextStyle(color: MyColors.inactiveIconColor, fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: width,
            height: height*.49,
            child: Column(
              children: [
                Container(
                  child: TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(text: 'Tab 1'),
                      Tab(text: 'Tab 2'),
                      Tab(text: 'Tab 3'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Center(child: Text('Content for Tab 1')),
                      Center(child: Text('Content for Tab 2')),
                      Center(child: Text('Content for Tab 3')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
