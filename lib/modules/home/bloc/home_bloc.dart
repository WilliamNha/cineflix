import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cineflix/modules/home/models/movie_model.dart';
import 'package:cineflix/modules/home/service/movie_service.dart';
import 'package:flutter/material.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialFetchMovieEvent>(homeInitFetchMovieEvent);
  }

  FutureOr<void> homeInitFetchMovieEvent(
      HomeInitialFetchMovieEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    List<MovieModel> movieList = await MovieService.getAllMovieData();
    if (movieList.isNotEmpty) {
      emit(HomeMovieLoadedSuccessState(movieList: movieList));
    } else {
      emit(HomeMovieErrorState());
    }
  }
}
