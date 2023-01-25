import 'package:api_with_riverpod/ui/screens/homeScreen/homeScreen.dart';
import 'package:api_with_riverpod/ui/screens/movieDetails/movieDetails.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final loggedInRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: HomeScreen()),
  '/:id': (routeData) =>
      MaterialPage(child: MovieDetails(id: routeData.pathParameters['id']!))
});
