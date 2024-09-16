import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/services/top_rated/bloc/top_rated_event.dart';
import 'package:movie/services/top_rated/bloc/top_rated_state.dart';
import 'package:movie/services/top_rated/top_rated_service.dart';

class TopRatedBloc extends Bloc<TopRatedEvent, TopRatedState> {
  final TopRatedApiService apiService;

  TopRatedBloc({required this.apiService}) : super(TopRatedInitial()) {
    on<FetchTopRated>((event, emit) async {
      emit(TopRatedLoading());
      try {
        final topRated = await apiService.getTopRated();
        emit(TopRatedLoaded(topRated));
      } catch (e) {
        emit(TopRatedError(e.toString()));
      }
    });
  }
}
