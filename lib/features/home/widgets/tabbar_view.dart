import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/features/home/home_page.dart';
import 'package:movie/features/home/widgets/top_rated.dart';
import 'package:movie/services/now_playing/bloc/now_playing_bloc.dart';
import 'package:movie/services/now_playing/bloc/now_playing_state.dart';
import 'package:movie/services/top_rated/bloc/top_rated_bloc.dart';
import 'package:movie/services/top_rated/bloc/top_rated_state.dart';
import 'package:movie/services/upcoming/bloc/upcoming_bloc.dart';
import 'package:movie/services/upcoming/bloc/upcoming_state.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({
    super.key,
    required this.width,
    required this.height,
    required TabController tabController,
  }) : _tabController = tabController;

  final double width;
  final double height;
  final TabController _tabController;

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      width: widget.width,
      height: widget.height * .462,
      child: Column(
        children: [
          Container(
            child: TabBar(
              labelColor: Colors.white,
              indicatorColor: MyColors.secondaryColor,
              controller: widget._tabController,
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
              controller: widget._tabController,
              children: [
                BlocBuilder<NowPlayingBloc, NowPlayingState>(
                  builder: (context, state) {
                    if (state is NowPlayingLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is NowPlayingLoaded) {
                      int itemCount = state.nowPlaying.results.length;
                      return Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: GridView.builder(
                          itemCount: itemCount,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // Number of items in each row
                            crossAxisSpacing: 16.0,
                            childAspectRatio: .55,
                          ),
                          itemBuilder: (context, index) {
                            final item = state.nowPlaying.results;

                            return SizedBox(
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.network(
                                      item[index].fullPosterUrl,
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
                      );
                    } else if (state is NowPlayingError) {
                      return Center(child: Text(state.message));
                    }
                    return Container();
                  },
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: BlocBuilder<UpcomingBloc, UpcomingState>(
                      builder: (context, state) {
                        if (state is UpcomingLoading) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is UpcomingLoaded) {
                          int itemCount = state.nowPlaying.results.length;
                          return GridView.builder(
                            itemCount: itemCount,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Number of items in each row
                              mainAxisSpacing: 16.0,
                              crossAxisSpacing: 16.0,
                            ),
                            itemBuilder: (context, index) {
                              final item = state.nowPlaying.results;
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
                          );
                        }
                        return Container();
                      },
                    )),
                BlocBuilder<TopRatedBloc, TopRatedState>(
                  builder: (context, state) {
                    if (state is TopRatedLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is TopRatedLoaded) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: GridView.builder(
                          itemCount: movies.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // Number of items in each row
                            mainAxisSpacing: 160.0,
                            crossAxisSpacing: 16.0,
                          ),
                          itemBuilder: (context, index) {
                            final item = state.topRated.results[index];
                            return SizedBox(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.network(
                                      item.fullPosterUrl,
                                      height: 200, // Tasvir balandligi
                                      width: 130, // Tasvir kengligi
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    } else if (state is TopRatedError) {
                      return Center(child: Text(state.message));
                    }
                    return Container();
                  },
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
    );
  }
}
