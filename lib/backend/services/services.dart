import 'dart:convert';

import 'package:api_with_riverpod/backend/models/movieDetailsModel.dart';
import 'package:api_with_riverpod/backend/models/trending_model.dart';
import 'package:api_with_riverpod/backend/services/utilities/app_url.dart';
import 'package:api_with_riverpod/core/failure.dart';
import 'package:api_with_riverpod/core/type_defs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

final servicesProvider = Provider(
  (ref) => Services(),
);

class Services {
  Future<List<Movie>?> getMovies() async {
    Response response = await http.get(Uri.parse(AppUrl.trendingUrl));
    if (response.statusCode == 200) {
      final decodeJson = jsonDecode(response.body);

      final List movies = decodeJson['results'];
      final List<Movie> fMovies =
          movies.map((fMovie) => Movie.fromJson(fMovie)).toList();

      return fMovies;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<MovieDetails> getMovieDetails(String id) async {
    final apiUrl =
        'https://api.themoviedb.org/3/movie/${id}?api_key=0d957d3f8ad5d40c48d5eac32810e93f&language=en-US';
    Response response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final decodeJson = jsonDecode(response.body);
      final movieDetails = MovieDetails.fromJson(decodeJson);
      print(movieDetails.originalTitle);
      return movieDetails;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
