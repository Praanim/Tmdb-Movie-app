import 'package:api_with_riverpod/controller/services_controller.dart';
import 'package:api_with_riverpod/core/error_text.dart';
import 'package:api_with_riverpod/core/loader.dart';
import 'package:api_with_riverpod/ui/components/common.dart';
import 'package:api_with_riverpod/ui/components/video_card.dart';
import 'package:api_with_riverpod/ui/components/youtube_player_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetails extends ConsumerWidget {
  final String id;
  const MovieDetails({
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(movieDetailsProvider(id)).when(
          data: (movieDetails) {
            if (movieDetails == null) {
              return Scaffold(
                body: Center(child: Text("Something went wrong")),
              );
            }
            return Scaffold(
                backgroundColor: Common.backGroundColor,
                body: NestedScrollView(
                  floatHeaderSlivers: true,
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverAppBar(
                      backgroundColor: Common.backGroundColor,
                      expandedHeight: 240,
                      flexibleSpace: FlexibleSpaceBar(
                        title: null,
                        background: Image.network(
                          'https://image.tmdb.org/t/p/w500' +
                              movieDetails.posterPath,
                          errorBuilder: (context, error, stackTrace) {
                            print(error.toString());
                            return Text("Your Error widget");
                          },
                          fit: BoxFit.fill,
                        ),
                      ),
                      floating: true,
                      pinned: true,
                    ),
                  ],
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Original Title :",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 87, 93, 119),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              movieDetails.originalTitle,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              "Time: ",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 87, 93, 119),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              movieDetails.runtime.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              "Released: ",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 87, 93, 119),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${movieDetails.releaseDate}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          movieDetails.overview,
                          style: TextStyle(
                              color: Color.fromARGB(255, 87, 93, 119),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // VideoCard(
                        //   ref: ref,
                        //   movId: movieDetails.id.toString(),
                        // )

                        YoutubePlayerCard(movid: movieDetails.id.toString())
                      ],
                    ),
                  ),
                ));
          },
          error: (error, stackTrace) => ErrorText(error: error.toString()),
          loading: () {
            return Loader();
          },
        );
  }
}
