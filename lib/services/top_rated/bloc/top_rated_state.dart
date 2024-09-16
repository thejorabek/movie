import 'package:equatable/equatable.dart';
import 'package:movie/core/models/top_rated.dart';

abstract class TopRatedState extends Equatable {
  const TopRatedState();
  
  @override
  List<Object> get props => [];
}

class TopRatedInitial extends TopRatedState {}

class TopRatedLoading extends TopRatedState {}

class TopRatedLoaded extends TopRatedState {
  final TopRatedModel topRated;

  const TopRatedLoaded(this.topRated);

  @override
  List<Object> get props => [topRated];
}

class TopRatedError extends TopRatedState {
  final String message;

  const TopRatedError(this.message);

  @override
  List<Object> get props => [message];
}