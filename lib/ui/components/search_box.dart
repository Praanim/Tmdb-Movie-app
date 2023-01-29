import 'package:api_with_riverpod/ui/screens/homeScreen/search_movie_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for Movies',
        suffixIcon: Icon(Icons.search),
      ),
    );
  }
}
