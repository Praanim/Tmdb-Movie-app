import 'package:api_with_riverpod/backend/models/trending_model.dart';
import 'package:api_with_riverpod/ui/components/common.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class BigCard extends StatelessWidget {
  final Movie movie;
  const BigCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //go to movie details page
        //using dynamic routing ie slug
        //just like in riwant reddit clone tutorial
        print(movie.id);
        Routemaster.of(context).push('/${movie.id}');
      },
      child: Card(
        color: Common.backGroundColor,
        elevation: 50,
        shadowColor: Color.fromARGB(255, 79, 77, 92),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          // height: 700,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500' + movie.posterPath,
                  ),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
// MediaQuery.of(context).size.height / 1.5
// MediaQuery.of(context).size.width / 0.7
