import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/others/scaffold_with_navbar/bloc/navigation_bloc.dart';
import 'package:movie/router/app_routes.dart';
import 'package:movie/services/detail/bloc/detail_bloc.dart';
import 'package:movie/services/detail/detail_service.dart';
import 'package:movie/services/now_playing/bloc/now_playing_bloc.dart';
import 'package:movie/services/now_playing/now_playing_service.dart';
import 'package:movie/services/popular/bloc/popular_bloc.dart';
import 'package:movie/services/popular/popular_service.dart';
import 'package:movie/services/top_rated/bloc/top_rated_bloc.dart';
import 'package:movie/services/top_rated/top_rated_service.dart';
import 'package:movie/services/upcoming/bloc/upcoming_bloc.dart';
import 'package:movie/services/upcoming/upcoming_sercvice.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => NavigationBloc(),
          ),
          BlocProvider(
            create: (context) => TopRatedBloc(apiService: TopRatedApiService()),
          ),
          BlocProvider(
            create: (context) => NowPlayingBloc(apiService: NowPlayingService()),
          ),
          BlocProvider(
            create: (context) => UpcomingBloc(apiService: UpcomingService()),
          ),
          BlocProvider(
            create: (context) => PopularBloc(apiService: PopularService()),
          ),
          BlocProvider(create: (context) => MovieBloc(movieService: MovieService())),
        ],
        child: MaterialApp.router(
          theme: ThemeData(
            fontFamily: 'Montserrat', // Set the primary color for the app
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ),
      );
}
