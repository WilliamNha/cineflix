import 'dart:convert';
import 'dart:developer';

import 'package:cineflix/constants/app_constants.dart';
import 'package:cineflix/modules/home/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieService {
  static Future<List<MovieModel>> getAllMovieData() async {
    var client = http.Client();
    List<MovieModel> movieList = [];
    try {
      var response =
          await client.get(Uri.parse("${AppConstant.baseUrl}/movie"), headers: {
        "Content-Type": "application/json",
      });
      var decodedResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (var movie in decodedResponse) {
          movieList.add(MovieModel.fromJson(movie));
        }
        // debugPrint("movie list: ${movieList.length}");
      }
      return movieList;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
