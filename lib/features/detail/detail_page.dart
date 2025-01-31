import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/constants/icons_constants.dart';
import 'package:movie/core/models/watchlisted.dart';
import 'package:movie/core/widgets/appbar/custom_appbar.dart';
import 'package:movie/core/widgets/infos/duration_widget.dart';
import 'package:movie/core/widgets/infos/rate_widget.dart';
import 'package:movie/core/widgets/infos/ticket_widget.dart';
import 'package:movie/core/widgets/infos/year_widget.dart';
import 'package:movie/features/detail/bloc/watchlisted_bloc.dart';
import 'package:movie/features/detail/bloc/watchlisted_event.dart';
import 'package:movie/features/detail/bloc/watchlisted_state.dart';
import 'package:movie/features/detail/widgets/glass_container.dart';
import 'package:movie/services/detail/bloc/detail_bloc.dart';
import 'package:movie/services/detail/bloc/detail_event.dart';
import 'package:movie/services/detail/bloc/edtail_state.dart';
import 'package:movie/services/detail/detail_service.dart';

class DetailPage extends StatefulWidget {
  final int movieId;

  const DetailPage({super.key, required this.movieId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

final List<Map<String, String>> castMembers = [
  {
    'name': 'Tom Holland',
    'imageUrl':
        'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQxjGyv75mIabHjZS8sAsiOQn0YGeaVkIZyM1BR6l63VH9e7C_W', // Replace with actual image URL
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
    'imageUrl':
        'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcTRFb9sqd8L-IvF6Uj6dxnnKOuuhfRlF2aArnDkQyudZP4ZjKBfETwCXMntRj0YOuXqQ1oB4K3971hMqAc',
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
    return BlocProvider(
        create: (context) => MovieBloc(
              movieService: context.read<MovieService>(),
            )..add(FetchMovieDetails(widget.movieId)),
        child: BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
          if (state is MovieLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieError) {
            return Center(child: Text(state.message));
          } else if (state is MovieLoaded) {
            final movie = state.movie;
            return Scaffold(
                backgroundColor: MyColors.backgroundColor,
                appBar: CustomAppBar(
                  
                  icon: BlocBuilder<MovieListBloc, MovieListState>(
                    builder: (context, state) {
                      final isInList = state is MovieListSuccess && 
                          state.movies.any((m) => m.id == movie.id);
                      return Icon(
                        isInList ? Icons.bookmark : Icons.bookmark_border_rounded,
                        color: Colors.white,
                      );
                    },
                  ),
                  title: 'Details',
                  onTap: () {
                    final currentState = context.read<MovieListBloc>().state;
                    if (currentState is MovieListSuccess) {
                      final isInList = currentState.movies.any((m) => m.id == movie.id);
                      
                      context.read<MovieListBloc>().add(
                        isInList 
                            ? RemoveFromList(movie.id)
                            : AddMovieToList(
                                MovieList(
                                  id: movie.id,
                                  title: movie.title,
                                  posterPath: movie.posterPath,
                                  voteAverage: movie.voteAverage,
                                ),
                              ),
                      );
                    }
                  },
                ),
                body: Column(children: [
                  SizedBox(
                    width: width,
                    height: height * .35,
                    child: Stack(
                      children: [
                        Container(
                          height: height * .25,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                              color: Colors.white),
                          child: ClipRRect(
                              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                              child: Image.network('${state.movie.fullBackdropUrl} ?? ' '}', fit: BoxFit.cover, height: height, width: width)),
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
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.black),
                                    width: width * .25,
                                    height: height * .17,
                                    child: Image.network('${state.movie.fullPosterUrl} ?? ' ''),
                                  ),
                                ),
                                SizedBox(width: MediaQuery.sizeOf(context).width * .03),
                                Text(
                                  state.movie.originalTitle,
                                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
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
                            child: RateWidget(rate: state.movie.voteAverage.toStringAsFixed(1)),
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
                            YearWidget(year: state.movie.releaseDate.year),
                            SvgPicture.asset(MyIcons.divider),
                            DurationWidget(duration: state.movie.runtime),
                            SvgPicture.asset(MyIcons.divider),
                            TicketWidget(ticket: state.movie.genres[0].name),
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
                        TabBar(
                          labelColor: Colors.white,
                          indicatorColor: MyColors.secondaryColor,
                          controller: _tabController,
                          dividerColor: MyColors.backgroundColor,
                          tabs: const [
                            Tab(text: 'About Movie'),
                            Tab(text: 'Reviews'),
                            Tab(text: 'Cast'),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(25),
                                child: Text(state.movie.overview, style: const TextStyle(color: Colors.white)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(25),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        const CircleAvatar(),
                                        SizedBox(height: height * .015),
                                        const Text('6.3', style: TextStyle(color: MyColors.activeIconColor))
                                      ],
                                    ),
                                    SizedBox(width: width * .05),
                                    SizedBox(
                                      width: width * .7,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('Iqbal Shafiq Rozaan', style: TextStyle(color: Colors.white)),
                                          SizedBox(height: height * .01),
                                          const Text(
                                              'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government.',
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
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
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
                                          const SizedBox(height: 8.0),
                                          Text(
                                            castMembers[index]['name']!,
                                            style: const TextStyle(
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
          return const SizedBox();
        }));
  }
}
