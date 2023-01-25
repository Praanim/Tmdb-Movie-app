import 'package:api_with_riverpod/backend/models/movieDetailsModel.dart';
import 'package:api_with_riverpod/backend/models/trending_model.dart';
import 'package:api_with_riverpod/backend/services/services.dart';
import 'package:api_with_riverpod/core/type_defs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final trendingMoviesProvider = FutureProvider<List<Movie>?>((ref) async {
  return ref.watch(servicesProvider).getMovies();
});

final movieDetailsProvider = FutureProvider.family<MovieDetails, String>(
  (ref, String id) async {
    return ref.watch(servicesProvider).getMovieDetails(id);
  },
);
