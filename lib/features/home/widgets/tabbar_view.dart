import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/features/home/home_page.dart';
import 'package:movie/services/now_playing/bloc/now_playing_bloc.dart';
import 'package:movie/services/now_playing/bloc/now_playing_event.dart';
import 'package:movie/services/now_playing/bloc/now_playing_state.dart';
import 'package:movie/services/popular/bloc/popular_bloc.dart';
import 'package:movie/services/popular/bloc/popular_event.dart';
import 'package:movie/services/popular/bloc/popular_state.dart';
import 'package:movie/services/top_rated/bloc/top_rated_bloc.dart';
import 'package:movie/services/top_rated/bloc/top_rated_event.dart';
import 'package:movie/services/top_rated/bloc/top_rated_state.dart';
import 'package:movie/services/upcoming/bloc/upcoming_bloc.dart';
import 'package:movie/services/upcoming/bloc/upcoming_event.dart';
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
  void initState() {
    super.initState();
    BlocProvider.of<NowPlayingBloc>(context).add(FetchNowPlaying());
    BlocProvider.of<UpcomingBloc>(context).add(FetchUpcoming());
    BlocProvider.of<TopRatedBloc>(context).add(FetchTopRated());
    BlocProvider.of<PopularBloc>(context).add(FetchPopular());
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      width: widget.width,
      height: widget.height * .462,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.white,
            indicatorColor: MyColors.secondaryColor,
            controller: widget._tabController,
            dividerColor: MyColors.backgroundColor,
            tabs: const [
              Tab(text: 'Now playing'),
              Tab(text: 'Upcoming'),
              Tab(text: 'Top rated'),
              Tab(text: 'Popular'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: widget._tabController,
              children: [
                BlocBuilder<NowPlayingBloc, NowPlayingState>(
                  builder: (context, state) {
                    if (state is NowPlayingLoading) {
                      return const Center(child: Expanded(child: SizedBox()));
                    } else if (state is NowPlayingLoaded) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: GridView.builder(
                          itemCount: state.nowPlaying.results.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // Number of items in each row
                            mainAxisSpacing: height * .1,
                            crossAxisSpacing: width * .03,
                          ),
                          itemBuilder: (context, index) {
                            final item = state.nowPlaying.results[index];
                            return SizedBox(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.network(
                                      item.fullPosterUrl,
                                      height: height * .1, // Tasvir balandligi
                                      width: width * .3, // Tasvir kengligi
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
                      return Center(child: Text(state.message,style: const TextStyle(color: Colors.white),));
                    }
                    return Container();
                  },
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: BlocBuilder<UpcomingBloc, UpcomingState>(
                      builder: (context, state) {
                        if (state is UpcomingLoading) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (state is UpcomingLoaded) {
                          int itemCount = state.nowPlaying.results.length;
                          return GridView.builder(
                            itemCount: itemCount,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, // Number of items in each row
                              mainAxisSpacing: height * .1,
                              crossAxisSpacing: width * .03,
                            ),
                            itemBuilder: (context, index) {
                              final item = state.nowPlaying.results[index];
                              return SizedBox(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.network(
                                    item.fullPosterUrl,
                                    height: height * .2, // Tasvir balandligi
                                    width: width * .3, // Tasvir kengligi
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
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is TopRatedLoaded) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: GridView.builder(
                          itemCount: movies.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // Number of items in each row
                            mainAxisSpacing: height * .1,
                            crossAxisSpacing: width * .03,
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
                                      height: height * .2, // Tasvir balandligi
                                      width: width * .3, // Tasvir kengligi
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
                BlocBuilder<PopularBloc, PopularState>(
                  builder: (context, state) {
                    if (state is PopularLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is PopularLoaded) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: GridView.builder(
                          itemCount: movies.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // Number of items in each row
                            mainAxisSpacing: height * .1,
                            crossAxisSpacing: width * .03,
                          ),
                          itemBuilder: (context, index) {
                            final item = state.popular.results[index];
                            return SizedBox(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.network(
                                      item.fullPosterUrl,
                                      height: height * .2,
                                      width: width * .3,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    } else if (state is PopularError) {
                      return Center(child: Text(state.props.toString()));
                    }
                    return Container();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
