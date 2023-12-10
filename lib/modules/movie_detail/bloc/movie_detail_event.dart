part of 'movie_detail_bloc.dart';

@immutable
class MovieDetailEvent {}

class MovieDetailFetchMovieEvent extends MovieDetailEvent {
  final String movieID;
  MovieDetailFetchMovieEvent({required this.movieID});
}
