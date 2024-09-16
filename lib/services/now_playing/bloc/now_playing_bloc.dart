import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/services/now_playing/bloc/now_playing_event.dart';
import 'package:movie/services/now_playing/bloc/now_playing_state.dart';
import 'package:movie/services/now_playing/now_playing_service.dart';
import 'package:movie/services/top_rated/bloc/top_rated_event.dart';
import 'package:movie/services/top_rated/bloc/top_rated_state.dart';
import 'package:movie/services/top_rated/top_rated_service.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  final NowPlayingService apiService;

  NowPlayingBloc({required this.apiService}) : super(NowPlayingInitial()) {
    on<FetchNowPlaying>((event, emit) async {
      emit(NowPlayingLoading());
      try {
        final nowPlaying = await apiService.getNowPlaying();
        emit(NowPlayingLoaded(nowPlaying));
      } catch (e) {
        emit(NowPlayingError(e.toString()));
      }
    });
  }
}
