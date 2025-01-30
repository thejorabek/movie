import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/models/watchlisted.dart';
import 'package:movie/features/detail/bloc/watchlisted_event.dart';
import 'package:movie/features/detail/bloc/watchlisted_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final List<MovieList> _movies = [];

  MovieListBloc() : super(MovieListInitial()) {
    on<AddMovieToList>((event, emit) {
      print('Adding movie: ${event.movie.id}');
      _movies.add(event.movie);
      emit(MovieListSuccess(List.from(_movies)));
    });

    on<RemoveFromList>((event, emit) {
      print('Removing movie: ${event.movieId}');
      _movies.removeWhere((movie) => movie.id == event.movieId);
      emit(MovieListSuccess(List.from(_movies)));
    });
  }
}