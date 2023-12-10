import 'dart:convert';
import 'dart:developer';
import 'package:cineflix/modules/home/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:cineflix/constants/app_constants.dart';

class MovieDetailService {
  static Future<MovieModel?> getMovieByID({required String movieID}) async {
    var client = http.Client();
    var movieModel = MovieModel();
    try {
      var response = await client
          .get(Uri.parse("${AppConstant.baseUrl}/movie/$movieID"), headers: {
        "Content-Type": "application/json",
      });
      var decodedResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        movieModel = MovieModel.fromJson(decodedResponse);
        // debugPrint("movie model: $movieModel");
        return movieModel;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
