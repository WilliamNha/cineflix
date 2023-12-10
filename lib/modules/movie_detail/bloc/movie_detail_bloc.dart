import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cineflix/modules/home/models/movie_model.dart';
import 'package:cineflix/modules/movie_detail/service/movie_detail_service.dart';
import 'package:flutter/material.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc() : super(MovieDetailInitial()) {
    on<MovieDetailFetchMovieEvent>(movieDetailFetchMovieEvent);
  }

  FutureOr<void> movieDetailFetchMovieEvent(
      MovieDetailFetchMovieEvent event, Emitter<MovieDetailState> emit) async {
    final movieID = event.movieID;
    emit(MovieDetailLoadingState());
    MovieModel? movieData =
        await MovieDetailService.getMovieByID(movieID: movieID);
    if (movieData != null) {
      emit(MovieDetailLoadedSuccessState(movieData: movieData));
    } else {
      emit(MovieDetailErrorState());
    }
  }
}
