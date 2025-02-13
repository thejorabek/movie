import 'package:equatable/equatable.dart';
import 'package:movie/core/models/upcoming.dart';

abstract class UpcomingState extends Equatable {
  const UpcomingState();
  
  @override
  List<Object> get props => [];
}

class UpcomingInitial extends UpcomingState {}

class UpcomingLoading extends UpcomingState {}

class UpcomingLoaded extends UpcomingState {
  final UpcomingModel upcomingMovie;

  const UpcomingLoaded(this.upcomingMovie);

  @override
  List<Object> get props => [upcomingMovie];
}

class UpcomingError extends UpcomingState {
  final String message;

  const UpcomingError(this.message);

  @override
  List<Object> get props => [message];
}