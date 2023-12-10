part of 'movie_detail_bloc.dart';

@immutable
class MovieDetailState {}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoadingState extends MovieDetailState {}

class MovieDetailLoadedSuccessState extends MovieDetailState {
  final MovieModel movieData;
  MovieDetailLoadedSuccessState({required this.movieData});
}

class MovieDetailErrorState extends MovieDetailState {}
