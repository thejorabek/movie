import 'package:equatable/equatable.dart';
import 'package:movie/core/models/watchlisted.dart';

abstract class MovieListEvent extends Equatable {
  const MovieListEvent();
}

class AddMovieToList extends MovieListEvent {
  final MovieList movie;
  const AddMovieToList(this.movie);
  
  @override
  List<Object?> get props => [movie];
}

class RemoveFromList extends MovieListEvent {
  final int movieId;
  const RemoveFromList(this.movieId);
  
  @override
  List<Object?> get props => [movieId];
}