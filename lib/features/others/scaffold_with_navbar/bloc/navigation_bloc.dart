import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/others/scaffold_with_navbar/bloc/navigation_event.dart';
import 'package:movie/features/others/scaffold_with_navbar/bloc/navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(0)) {
    on<UpdateNavigationIndex>((event, emit) {
      emit(NavigationState(event.index));
    });
  }
}