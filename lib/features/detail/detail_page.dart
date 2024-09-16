import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/constants/icons_constants.dart';
import 'package:movie/core/widgets/appbar/custom_appbar.dart';
import 'package:movie/core/widgets/infos/duration_widget.dart';
import 'package:movie/core/widgets/infos/rate_widget.dart';
import 'package:movie/core/widgets/infos/ticket_widget.dart';
import 'package:movie/core/widgets/infos/year_widget.dart';
import 'package:movie/features/detail/widgets/glass_container.dart';
import 'package:movie/router/app_routes.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

final List<Map<String, String>> castMembers = [
  {
    'name': 'Tom Holland',
    'imageUrl': 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQxjGyv75mIabHjZS8sAsiOQn0YGeaVkIZyM1BR6l63VH9e7C_W', // Replace with actual image URL
  },
  {
    'name': 'Zendaya',
    'imageUrl': 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQr_o9srG0oxgqnu3ZBy9mBqmVzE9CAZycNP90EzYj09V-Qbrzv',
  },
  {
    'name': 'Benedict Cumberbatch',
    'imageUrl': 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTA4pJIKNOA04hZkHz2TOgIUDraO4aL8BURcO4wpNUSZNTHVymn',
  },
  {
    'name': 'Brad Pitt',
    'imageUrl': 'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcTRFb9sqd8L-IvF6Uj6dxnnKOuuhfRlF2aArnDkQyudZP4ZjKBfETwCXMntRj0YOuXqQ1oB4K3971hMqAc',
  },
  // Add more cast members if needed
];

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
        appBar: CustomAppBar(
          icon: Icon(Icons.bookmark_border_rounded, color: Colors.white),
          title: 'Details',
          onTap: () {},
        ),
        body: Column(children: [
          SizedBox(
            width: width,
            height: height * .39,
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
                    child: RateWidget(),
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
                    YearWidget(),
                    SvgPicture.asset(MyIcons.divider),
                    DurationWidget(),
                    SvgPicture.asset(MyIcons.divider),
                    TicketWidget(),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: height * .01),
          SizedBox(
            width: width,
            height: height * .49,
            child: Column(
              children: [
                Container(
                  child: TabBar(
                    labelColor: Colors.white,
                    indicatorColor: MyColors.secondaryColor,
                    controller: _tabController,
                    dividerColor: MyColors.backgroundColor,
                    tabs: [
                      Tab(text: 'About Movie'),
                      Tab(text: 'Reviews'),
                      Tab(text: 'Cast'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: Text(
                            'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.',
                            style: TextStyle(color: Colors.white)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: Row(
                          children: [
                            Column(
                              children: [CircleAvatar(), SizedBox(height: height * .015), Text('6.3', style: TextStyle(color: MyColors.activeIconColor))],
                            ),
                            SizedBox(width: width * .05),
                            SizedBox(
                              width: width * .7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Iqbal Shafiq Rozaan', style: TextStyle(color: Colors.white)),
                                  SizedBox(height: height * .01),
                                  const Text('From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government.',
                                      style: TextStyle(color: Colors.white))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GridView.builder(
                          itemCount: castMembers.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of items in each row
                            mainAxisSpacing: 16.0,
                            crossAxisSpacing: 16.0,
                          ),
                          itemBuilder: (context, index) {
                            return SizedBox(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ClipOval(
                                    child: Image.network(
                                      castMembers[index]['imageUrl']!,
                                      width: 130,
                                      height: 130,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    castMembers[index]['name']!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}








