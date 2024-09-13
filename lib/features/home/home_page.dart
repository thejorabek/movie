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

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                );
              },
            ),
          ),
          // MovieGrid(),
          // CategoryTabs(),
        ],
      ),
    );
  }
}
