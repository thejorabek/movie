import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/constants/icons_constants.dart';
import 'package:movie/features/home/widgets/movie_number.dart';
import 'package:movie/features/others/scaffold_with_navbar/bloc/navigation_bloc.dart';
import 'package:movie/features/others/scaffold_with_navbar/bloc/navigation_event.dart';
import 'package:movie/router/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final List<Map<String, String>> movies = [
  {
    "title": "Spider-Man: No Way Home",
    "image": "https://cdn.marvel.com/content/1x/spider-mannowayhome_lob_crd_03.jpg", // Tasvir URL'ini almashtiring
  },
  {
    "title": "Green Mile",
    "image":
        "https://resizing.flixster.com/05F90XUPmyteSngOV7qj5Zd5HfI=/206x305/v2/https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p24429_p_v12_bf.jpg", // Tasvir URL'ini almashtiring
  },
  {
    "title": "Jurassic World Dominion",
    "image": "https://upload.wikimedia.org/wikipedia/en/thumb/c/ce/JurassicWorldDominion_Poster.jpeg/220px-JurassicWorldDominion_Poster.jpeg", // Tasvir URL'ini almashtiring
  },
  {
    "title": "Jurassic World Dominion",
    "image": "https://upload.wikimedia.org/wikipedia/en/thumb/c/ce/JurassicWorldDominion_Poster.jpeg/220px-JurassicWorldDominion_Poster.jpeg", // Tasvir URL'ini almashtiring
  },
  {
    "title": "Spider-Man: No Way Home",
    "image": "https://cdn.marvel.com/content/1x/spider-mannowayhome_lob_crd_03.jpg", // Tasvir URL'ini almashtiring
  },
  {
    "title": "Green Mile",
    "image":
        "https://resizing.flixster.com/05F90XUPmyteSngOV7qj5Zd5HfI=/206x305/v2/https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p24429_p_v12_bf.jpg", // Tasvir URL'ini almashtiring
  },
  {
    "title": "Jurassic World Dominion",
    "image": "https://upload.wikimedia.org/wikipedia/en/thumb/c/ce/JurassicWorldDominion_Poster.jpeg/220px-JurassicWorldDominion_Poster.jpeg", // Tasvir URL'ini almashtiring
  },
  {
    "title": "Spider-Man: No Way Home",
    "image": "https://cdn.marvel.com/content/1x/spider-mannowayhome_lob_crd_03.jpg", // Tasvir URL'ini almashtiring
  },
  {
    "title": "Green Mile",
    "image":
        "https://resizing.flixster.com/05F90XUPmyteSngOV7qj5Zd5HfI=/206x305/v2/https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p24429_p_v12_bf.jpg", // Tasvir URL'ini almashtiring
  },
  // Qo'shimcha filmlar
];

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
        title: Text(
          ' What do you want to watch?',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: MyColors.backgroundColor,
      ),
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                context.read<NavigationBloc>().add(UpdateNavigationIndex(1));
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width * .9,
                height: MediaQuery.sizeOf(context).height * .06,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.black),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .05,
                    ),
                    Text('Search', style: TextStyle(color: MyColors.inactiveIconColor, fontSize: 18)),
                    // SvgPicture.asset(MyIcons.searchIcon, width: 30, height: 30)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * .03),
          Container(
            height: 250, // Bo'yi
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Gorizontal skroll qilish
              itemCount: movies.length,
              itemBuilder: (context, index) {
                int num = index;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go(Routes.detail);
                    },
                    child: Stack(
                      children: [
                        // Tasvir va nom
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.network(
                                movies[index]["image"]!,
                                height: 200, // Tasvir balandligi
                                width: 150, // Tasvir kengligi
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              movies[index]["title"]!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: -30,
                          left: 10,
                          child: Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Stack(
                              children: [
                                CustomPaint(
                                  painter: NumberPainter(stroke: true, num: num + 1), // Ko'k hoshiyali qatlam
                                  child: Text(
                                    '',
                                    style: TextStyle(
                                      fontSize: 120, // Matn o'lchami
                                      color: MyColors.inactiveIconColor, // Bu qatlamda matnni ko'rinmas qilamiz
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                CustomPaint(
                                  painter: NumberPainter(stroke: false, num: num + 1), // Kulrang to'ldirilgan qatlam
                                  child: Text(
                                    '',
                                    style: TextStyle(
                                      fontSize: 120, // Matn o'lchami
                                      color: MyColors.backgroundColor, // Bu qatlamda matnni ko'rinmas qilamiz
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: height * .02),
          SizedBox(
            width: width,
            height: height * .462,
            child: Column(
              children: [
                Container(
                  child: TabBar(
                    labelColor: Colors.white,
                    indicatorColor: MyColors.secondaryColor,
                    controller: _tabController,
                    dividerColor: MyColors.backgroundColor,
                    tabs: [
                      Tab(text: 'Now playing'),
                      Tab(text: 'Upcoming'),
                      Tab(text: 'Top rated'),
                      Tab(text: 'Popular'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: GridView.builder(
                          itemCount: movies.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // Number of items in each row
                            crossAxisSpacing: 16.0,
                            childAspectRatio: .55,
                          ),
                          itemBuilder: (context, index) {
                            return SizedBox(
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.network(
                                      movies[index]["image"]!,
                                      height: 200, // Tasvir balandligi
                                      width: 150, // Tasvir kengligi
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: GridView.builder(
                          itemCount: movies.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of items in each row
                            mainAxisSpacing: 16.0,
                            crossAxisSpacing: 16.0,
                          ),
                          itemBuilder: (context, index) {
                            return SizedBox(
                              child: ClipOval(
                                child: Image.network(
                                  movies[index]['imageUrl']!,
                                  width: 130,
                                  height: 130,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: GridView.builder(
                          itemCount: movies.length,
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
                                      movies[index]['imageUrl']!,
                                      width: 130,
                                      height: 130,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    movies[index]['name']!,
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
                      Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: GridView.builder(
                          itemCount: movies.length,
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
                                      movies[index]['imageUrl']!,
                                      width: 130,
                                      height: 130,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    movies[index]['name']!,
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
        ],
      ),
    );
  }
}
