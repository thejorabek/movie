import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/features/home/home_page.dart';
import 'package:movie/features/home/widgets/movie_number.dart';
import 'package:movie/router/app_routes.dart';
import 'package:movie/services/detail/bloc/detail_bloc.dart';
import 'package:movie/services/top_rated/bloc/top_rated_bloc.dart';
import 'package:movie/services/top_rated/bloc/top_rated_event.dart';
import 'package:movie/services/top_rated/bloc/top_rated_state.dart';

class TopRated extends StatefulWidget {
  TopRated({super.key});

  @override
  State<TopRated> createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TopRatedBloc>(context).add(FetchTopRated());
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return BlocBuilder<TopRatedBloc, TopRatedState>(
      builder: (context, state) {
        if (state is TopRatedLoading) {
          return Center(child: SizedBox(height: 200));
        } else if (state is TopRatedLoaded) {
          return Container(
            height: 250, // Bo'yi
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Gorizontal skroll qilish
              itemCount: state.topRated.results.length,
              itemBuilder: (context, index) {
                int num = index;
                final item = state.topRated.results[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go('/detail/${state.topRated.results[index].id}');
                    },
                    child: Stack(
                      children: [
                        // Tasvir va nom
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.network(
                                state.topRated.results[index].fullPosterUrl,
                                height: 200, // Tasvir balandligi
                                width: 150, // Tasvir kengligi
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 110,
                          child: Container(
                            // padding: EdgeInsets.all(6),
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
          );
        } else if (state is TopRatedError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return Container();
      },
    );
  }
}
