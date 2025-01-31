import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/core/widgets/appbar/custom_appbar.dart';
import 'package:movie/core/widgets/infos/duration_widget.dart';
import 'package:movie/core/widgets/infos/rate_widget.dart';
import 'package:movie/core/widgets/infos/year_widget.dart';
import 'package:movie/core/widgets/search/global_searchbar/global_searchbar.dart';
import 'package:movie/services/search/bloc/search_bloc.dart';
import 'package:movie/services/search/search_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return BlocProvider(
      create: (context) => SearchBloc(searchService: SearchService(dio: Dio())),
      child: Scaffold(
        backgroundColor: MyColors.backgroundColor,
        appBar: CustomAppBar(icon: const Icon(Icons.info_outline_rounded, color: Colors.white), title: 'Search', onTap: () {}),
        body: Column(
          children: [
            SizedBox(height: height * .02),
            const GlobalSearch(),
            SizedBox(height: height * .02),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return Center(child: Lottie.asset('assets/lotties/loading.json'));
                  } else if (state is SearchSuccess) {
                    if (state.results.isEmpty) {
                      return const Center(child: Text('No results found', style: TextStyle(color: Colors.white)));
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: state.results.length,
                      itemBuilder: (context, index) {
                        final movie = state.results[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: GestureDetector(
                            onTap: () => context.push('/detail/${movie.id}'),
                            child: Container(
                              height: height * 0.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: MyColors.secondaryColor,
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: Image.network(
                                      movie.fullBackdropUrl ?? '',
                                      height: double.infinity,
                                      width: 120,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Container(
                                          color: Colors.grey,
                                          child: const Icon(Icons.error),
                                        );
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            movie.title.toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 8),
                                          Text(movie.genreIds[0].toString()),
                                          const SizedBox(height: 4),
                                          RateWidget(rate: movie.voteAverage.toStringAsFixed(1).toString() ?? '0.0'),
                                          const SizedBox(height: 4),
                                          if (movie.releaseDate != null)
                                            YearWidget(
                                              year: movie.releaseDate!.year,
                                            ),
                                          const SizedBox(height: 4),
                                          DurationWidget(duration: 120),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is SearchError) {
                    return Center(child: Text(state.message, style: const TextStyle(color: Colors.white)));
                  }
                  return Center(child: SvgPicture.asset('assets/svg_images/search_page.svg'),);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
