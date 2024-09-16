import 'package:equatable/equatable.dart';

abstract class TopRatedEvent extends Equatable {
  const TopRatedEvent();

  @override
  List<Object> get props => [];
}

class FetchTopRated extends TopRatedEvent {}