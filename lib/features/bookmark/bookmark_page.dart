import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/constants/icons_constants.dart';
import 'package:movie/features/detail/bloc/watchlisted_bloc.dart';
import 'package:movie/features/detail/bloc/watchlisted_state.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: MyColors.backgroundColor,
        title: const Text(
          'Bookmarks',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<MovieListBloc, MovieListState>(
        builder: (context, state) {
          if (state is MovieListSuccess) {
            if (state.movies.isEmpty) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(MyIcons.box),
                  SizedBox(height: height * .02),
                  const Text('There Is No Movie Yet', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: height * .02),
                  const Text('Find your movie by Type title,\n categories, years, etc ',
                      style: TextStyle(color: Colors.white), textAlign: TextAlign.center)
                ],
              ));
            }
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.movies.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return GestureDetector(
                  onTap: () => context.go('/detail/${movie.id}'),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      movie.posterPath ?? '',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey,
                          child: const Icon(Icons.error),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
