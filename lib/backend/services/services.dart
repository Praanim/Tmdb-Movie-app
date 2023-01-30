import 'dart:convert';

import 'package:api_with_riverpod/backend/models/getVideoModel.dart';
import 'package:api_with_riverpod/backend/models/movieDetailsModel.dart';
import 'package:api_with_riverpod/backend/models/searchModel.dart';
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
      // for (int i = 0; i < fMovies.length; i++) {
      //   print(fMovies[i].posterPath);
      // }
      return fMovies;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<MovieDetails?> getMovieDetails(String id) async {
    final apiUrl =
        'https://api.themoviedb.org/3/movie/${id}?api_key=0d957d3f8ad5d40c48d5eac32810e93f&language=en-US';
    Response response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final decodeJson = jsonDecode(response.body);
      final movieDetails = MovieDetails.fromJson(decodeJson);
      print(movieDetails.originalTitle);
      return movieDetails;
    } else {
      return null;
    }
  }

  Future<Search?> getSearchResults(String query) async {
    final apiUrl =
        'https://api.themoviedb.org/3/search/movie?api_key=0d957d3f8ad5d40c48d5eac32810e93f&language=en-US&query=${query}&include_adult=false';
    Response response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final decodeJson = jsonDecode(response.body);
      final searchDetails = Search.fromJson(decodeJson);

      if (searchDetails.results.length == 0) {
        return null;
      }
      return searchDetails;
    }
    if (response.statusCode == 404) {
      print('error aayo hjr');
    }
  }

  Future<String?> getVideoUrls(String movid) async {
    final apiUrl =
        "https://api.themoviedb.org/3/movie/${movid}/videos?api_key=0d957d3f8ad5d40c48d5eac32810e93f&language=en-US";
    Response response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final decodeJson = jsonDecode(response.body);
      final List temp = decodeJson['results'];
      final List<VideoUrl> videoUrls = temp
          .map(
            (videoUrl) => VideoUrl.fromJson(videoUrl),
          )
          .toList();
      final List<String> realUrls = videoUrls.map((videoUrl) {
        return videoUrl.key;
      }).toList();
      // return videoUrls;
      if (realUrls.length != 0) {
        return realUrls[0];
      }
    } else {
      return null;
    }
  }
}
