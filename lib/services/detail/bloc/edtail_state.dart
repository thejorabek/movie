import 'package:movie/core/models/detail.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final DetailMovie movie;
  MovieLoaded(this.movie);
}

class MovieError extends MovieState {
  final String message;
  MovieError(this.message);
}