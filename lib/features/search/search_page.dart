import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/core/widgets/appbar/custom_appbar.dart';
import 'package:movie/core/widgets/infos/duration_widget.dart';
import 'package:movie/core/widgets/infos/rate_widget.dart';
import 'package:movie/core/widgets/infos/ticket_widget.dart';
import 'package:movie/core/widgets/infos/year_widget.dart';
import 'package:movie/core/widgets/search/global_searchbar/global_searchbar.dart';
import 'package:movie/features/home/home_page.dart';
import 'package:movie/services/search/bloc/search_bloc.dart';

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
      create: (context) => SearchBloc(),
      child: Scaffold(
        backgroundColor: MyColors.backgroundColor,
        appBar: CustomAppBar(icon: const Icon(Icons.info_outline_rounded, color: Colors.white), title: 'Search', onTap: () {}),
        body: Column(
          children: [
            SizedBox(height: height * .02),
            const GlobalSearch(),
            SizedBox(height: height * .02),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return Center(child: Lottie.asset('assets/lotties/loading.json', height: 200));
                } else if (state is SearchError) {
                  return Center(child: Text(state.message));
                } else if (state is SearchSuccess) {
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                        width: width,
                        height: height * .2,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.network(
                                movies[0]["image"]!,
                                height: 200, // Tasvir balandligi
                                width: 150, // Tasvir kengligi
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: width * .01),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: width * .02),
                              child: SizedBox(
                                width: width * .5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Spidermanfdsfsdfsdfsfdfsf',
                                      style: TextStyle(color: Colors.white, fontSize: 18),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: height * .02),
                                    RateWidget(
                                      rate: '3.4',
                                    ),
                                    SizedBox(height: height * .01),
                                    TicketWidget(
                                      ticket: 'Ticket',
                                    ),
                                    SizedBox(height: height * .01),
                                    YearWidget(
                                      year: 1976,
                                    ),
                                    SizedBox(height: height * .01),
                                    DurationWidget(
                                      duration: 143,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                  );
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
