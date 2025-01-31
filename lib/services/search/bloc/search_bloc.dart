import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/models/searched.dart';
import 'package:movie/services/search/search_service.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final _searchService = SearchService(dio: Dio());

  SearchBloc({required SearchService searchService}) : super(SearchInitial()) {
    on<SearchQueryChanged>(_onSearchQueryChanged);
  }

  Future<void> _onSearchQueryChanged(
    SearchQueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    final query = event.query;

    if (query.isEmpty) return emit(SearchInitial());

    emit(SearchLoading());
      final results = await _searchService.searchMovies(query);
    try {
      emit(SearchSuccess(results.toList()));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }

  @override
  void onTransition(Transition<SearchEvent, SearchState> transition) {
    super.onTransition(transition);
  }
}