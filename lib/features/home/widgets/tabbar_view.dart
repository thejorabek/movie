import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/router/app_routes.dart';
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
    return Column(
      children: [
        Expanded(
          child: TabBarView(
            controller: widget._tabController,
            children: [
              BlocBuilder<NowPlayingBloc, NowPlayingState>(
                builder: (context, state) {
                  if (state is NowPlayingLoading) {
                    return Container(
                        color: MyColors.backgroundColor,
                        child: Center(child: Lottie.asset('assets/lotties/loading.json')));
                  } else if (state is NowPlayingLoaded) {
                    return Container(
                      color: MyColors.backgroundColor,
                      child: Padding(
                        padding: EdgeInsets.only(left: width * .02, right: width * .02),
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.nowPlaying.results.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 0.6,
                          ),
                          itemBuilder: (context, index) {
                            final item = state.nowPlaying.results[index];
                            return GestureDetector(
                              onTap: (){
                                router.go('/detail/${item.id}');
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12.0),
                                        child: Image.network(
                                          item.fullPosterUrl,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Container(
                                              color: Colors.grey,
                                              child: const Icon(Icons.error),
                                            );
                                          },
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
                    );
                  } else if (state is NowPlayingError) {
                    return Center(
                        child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.white),
                    ));
                  }
                  return Container();
                },
              ),
              BlocBuilder<UpcomingBloc, UpcomingState>(
                builder: (context, state) {
                  if (state is UpcomingLoading) {
                    return Container(
                        color: MyColors.backgroundColor,
                        child: Center(child: Lottie.asset('assets/lotties/loading.json')));
                  } else if (state is UpcomingLoaded) {
                    return Container(
                      color: MyColors.backgroundColor,
                      child: Padding(
                        padding: EdgeInsets.only(left: width * .02, right: width * .02),
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.upcomingMovie.results.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 0.6,
                          ),
                          itemBuilder: (context, index) {
                            final item = state.upcomingMovie.results[index];
                            return GestureDetector(
                              onTap: (){
                                router.go('/detail/${item.id}');
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12.0),
                                        child: Image.network(
                                          item.fullPosterUrl,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Container(
                                              color: Colors.grey,
                                              child: const Icon(Icons.error),
                                            );
                                          },
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
                    );
                  } else if (state is UpcomingError) {
                    return Center(
                        child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.white),
                    ));
                  }
                  return Container();
                },
              ),
              BlocBuilder<TopRatedBloc, TopRatedState>(
                builder: (context, state) {
                  if (state is TopRatedLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is TopRatedLoaded) {
                    return Container(
                      color: MyColors.backgroundColor,
                      child: Padding(
                        padding: EdgeInsets.only(left: width * .02, right: width * .02),
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.topRated.results.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 0.6,
                          ),
                          itemBuilder: (context, index) {
                            final item = state.topRated.results[index];
                            return GestureDetector(
                              onTap: (){
                                router.go('/detail/${item.id}');
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12.0),
                                        child: Image.network(
                                          item.fullPosterUrl,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Container(
                                              color: Colors.grey,
                                              child: const Icon(Icons.error),
                                            );
                                          },
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
                    return Container(
                      color: MyColors.backgroundColor,
                      child: Padding(
                        padding: EdgeInsets.only(left: width * .02, right: width * .02),
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.popular.results.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 0.6,
                          ),
                          itemBuilder: (context, index) {
                            final item = state.popular.results[index];
                            return GestureDetector(
                              onTap: (){
                                router.go('/detail/${item.id}');
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12.0),
                                        child: Image.network(
                                          item.fullPosterUrl,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Container(
                                              color: Colors.grey,
                                              child: const Icon(Icons.error),
                                            );
                                          },
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
    );
  }
}
