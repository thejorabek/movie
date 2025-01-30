import 'package:equatable/equatable.dart';
import 'package:movie/core/models/watchlisted.dart';

abstract class MovieListState extends Equatable {
  const MovieListState();
}

class MovieListInitial extends MovieListState {
  @override
  List<Object?> get props => [];
}

class MovieListSuccess extends MovieListState {
  final List<MovieList> movies;
  const MovieListSuccess(this.movies);
  
  @override
  List<Object?> get props => [movies];

  get state => null;
}