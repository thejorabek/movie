import 'package:equatable/equatable.dart';
import 'package:movie/core/models/top_rated.dart';

abstract class PopularState extends Equatable {
  const PopularState();
  
  @override
  List<Object> get props => [];
}

class PopularInitial extends PopularState {}

class PopularLoading extends PopularState {}

class PopularLoaded extends PopularState {
  final TopRatedModel popular;

  const PopularLoaded(this.popular);

  @override
  List<Object> get props => [popular];
}

class PopularError extends PopularState {
  final String message;

  const PopularError(this.message);

  @override
  List<Object> get props => [message];
}