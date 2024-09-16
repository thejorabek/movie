import 'package:equatable/equatable.dart';
import 'package:movie/core/models/now_playing.dart';
import 'package:movie/core/models/top_rated.dart';

abstract class UpcomingState extends Equatable {
  const UpcomingState();
  
  @override
  List<Object> get props => [];
}

class UpcomingInitial extends UpcomingState {}

class UpcomingLoading extends UpcomingState {}

class UpcomingLoaded extends UpcomingState {
  final TopRatedModel nowPlaying;

  const UpcomingLoaded(this.nowPlaying);

  @override
  List<Object> get props => [nowPlaying];
}

class UpcomingError extends UpcomingState {
  final String message;

  const UpcomingError(this.message);

  @override
  List<Object> get props => [message];
}