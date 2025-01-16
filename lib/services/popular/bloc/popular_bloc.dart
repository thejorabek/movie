import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/services/popular/bloc/popular_event.dart';
import 'package:movie/services/popular/bloc/popular_state.dart';
import 'package:movie/services/popular/popular_service.dart';
class PopularBloc extends Bloc<PopularEvent, PopularState> {
  final PopularService apiService;

  PopularBloc({required this.apiService}) : super(PopularInitial()) {
    on<FetchPopular>((event, emit) async {
      emit(PopularLoading());
      try {
        final popular = await apiService.getPopular();
        emit(PopularLoaded(popular));
      } catch (e) {
        emit(PopularError(e.toString()));
      }
    });
  }
}