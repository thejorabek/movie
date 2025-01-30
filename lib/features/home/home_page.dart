import 'package:flutter/material.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/features/home/widgets/search_bar.dart';
import 'package:movie/features/home/widgets/tabbar_view.dart';
import 'package:movie/features/home/widgets/top_rated.dart';

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
    "image":
        "https://upload.wikimedia.org/wikipedia/en/thumb/c/ce/JurassicWorldDominion_Poster.jpeg/220px-JurassicWorldDominion_Poster.jpeg", // Tasvir URL'ini almashtiring
  },
  {
    "title": "Jurassic World Dominion",
    "image":
        "https://upload.wikimedia.org/wikipedia/en/thumb/c/ce/JurassicWorldDominion_Poster.jpeg/220px-JurassicWorldDominion_Poster.jpeg", // Tasvir URL'ini almashtiring
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
    "image":
        "https://upload.wikimedia.org/wikipedia/en/thumb/c/ce/JurassicWorldDominion_Poster.jpeg/220px-JurassicWorldDominion_Poster.jpeg", // Tasvir URL'ini almashtiring
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
];

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            expandedHeight: height * .45,
            floating: true,
            pinned: true,
            backgroundColor: MyColors.backgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  SizedBox(height: height * .08),
                  const Text(
                    'What do you want to watch today?',
                    style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: height * .02),
                  const SearchBarWidget(),
                  SizedBox(height: height * .02),
                  const TopRated()
                ],
              ),
            ),
            bottom: TabBar(
              controller: tabController,
              isScrollable: false,
              labelColor: Colors.white,
              indicatorColor: MyColors.secondaryColor,
              dividerColor: MyColors.backgroundColor,
              tabs: const [
                Tab(text: 'Now playing'),
                Tab(text: 'Upcoming'),
                Tab(text: 'Top rated'),
                Tab(text: 'Popular'),
              ],
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: tabController,
        children: [
          TabBarWidget(width: width, height: height, tabController: tabController),
        ],
      ),
    );
  }
}
