abstract class MovieEvent {}

class FetchMovieDetails extends MovieEvent {
  final int movieId;
  FetchMovieDetails(this.movieId);
}