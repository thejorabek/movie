import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/services/now_playing/bloc/now_playing_event.dart';
import 'package:movie/services/now_playing/bloc/now_playing_state.dart';
import 'package:movie/services/now_playing/now_playing_service.dart';
import 'package:movie/services/top_rated/bloc/top_rated_event.dart';
import 'package:movie/services/top_rated/bloc/top_rated_state.dart';
import 'package:movie/services/top_rated/top_rated_service.dart';
import 'package:movie/services/upcoming/bloc/upcoming_event.dart';
import 'package:movie/services/upcoming/bloc/upcoming_state.dart';
import 'package:movie/services/upcoming/upcoming_sercvice.dart';

class UpcomingBloc extends Bloc<UpcomingEvent,UpcomingState> {
  final UpcomingService apiService;

  UpcomingBloc({required this.apiService}) : super(UpcomingInitial()) {
    on<FetchUpcoming>((event, emit) async {
      emit(UpcomingLoading());
      try {
        final upcoming = await apiService.getUpcoming();
        emit(UpcomingLoaded(upcoming));
      } catch (e) {
        emit(UpcomingError(e.toString()));
      }
    });
  }
}
