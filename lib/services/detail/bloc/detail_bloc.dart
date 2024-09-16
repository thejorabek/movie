import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/services/detail/bloc/detail_event.dart';
import 'package:movie/services/detail/bloc/edtail_state.dart';
import 'package:movie/services/detail/detail_service.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieService movieService;

  MovieBloc({required this.movieService}) : super(MovieInitial()) {
    on<FetchMovieDetails>(_onFetchMovieDetails);
  }

  Future<void> _onFetchMovieDetails(
    FetchMovieDetails event,
    Emitter<MovieState> emit,
  ) async {
    emit(MovieLoading());
    try {
      final movie = await movieService.getMovieDetails(event.movieId);
      emit(MovieLoaded(movie));
    } catch (e) {
      emit(MovieError('Failed to fetch movie details: ${e.toString()}'));
    }
  }
}
