import 'package:equatable/equatable.dart';
import 'package:movie/core/models/now_playing.dart';

abstract class NowPlayingState extends Equatable {
  const NowPlayingState();
  
  @override
  List<Object> get props => [];
}

class NowPlayingInitial extends NowPlayingState {}

class NowPlayingLoading extends NowPlayingState {}

class NowPlayingLoaded extends NowPlayingState {
  final NowPlaying nowPlaying;

  const NowPlayingLoaded(this.nowPlaying);

  @override
  List<Object> get props => [nowPlaying];
}

class NowPlayingError extends NowPlayingState {
  final String message;

  const NowPlayingError(this.message);

  @override
  List<Object> get props => [message];
}