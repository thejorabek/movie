import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/features/home/widgets/movie_number.dart';
import 'package:movie/features/home/widgets/search_bar.dart';
import 'package:movie/features/home/widgets/tabbar_view.dart';
import 'package:movie/features/home/widgets/top_rated.dart';
import 'package:movie/features/others/scaffold_with_navbar/bloc/navigation_bloc.dart';
import 'package:movie/features/others/scaffold_with_navbar/bloc/navigation_event.dart';
import 'package:movie/router/app_routes.dart';
import 'package:movie/services/top_rated/bloc/top_rated_bloc.dart';
import 'package:movie/services/top_rated/bloc/top_rated_event.dart';

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
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        title: const Text(
          ' What do you want to watch?',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: MyColors.backgroundColor,
      ),
      body: Column(
        children: [
          const SearchBarWidget(),
          SizedBox(height: MediaQuery.sizeOf(context).height * .03),
          const TopRated(),
          SizedBox(height: height * .02),
          TabBarWidget(width: width, height: height, tabController: tabController)
        ],
      ),
    );
  }
}
