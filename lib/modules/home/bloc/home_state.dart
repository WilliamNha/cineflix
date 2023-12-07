part of 'home_bloc.dart';

@immutable
class HomeState {}

class HomeInitial extends HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeMovieLoadedSuccessState extends HomeState {
  final List<MovieModel> movieList;
  HomeMovieLoadedSuccessState({required this.movieList});
}

//for action state
class HomeMovieErrorState extends HomeActionState {}
