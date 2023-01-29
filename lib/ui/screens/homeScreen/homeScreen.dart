import 'package:api_with_riverpod/controller/services_controller.dart';
import 'package:api_with_riverpod/core/error_text.dart';
import 'package:api_with_riverpod/core/loader.dart';
import 'package:api_with_riverpod/ui/components/big_mov_card.dart';
import 'package:api_with_riverpod/ui/components/common.dart';
import 'package:api_with_riverpod/ui/components/search_box.dart';
import 'package:api_with_riverpod/ui/screens/homeScreen/search_movie_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final String randomphoto =
      'https://imgs.search.brave.com/jDf0IJpjxJTsdFTvYtX5fJwuZlJVvCy7OeM-fVS0HO8/rs:fit:493:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5h/d0FpTVMxQkNBUTJ4/UzJsY2RYR2x3SGFI/SCZwaWQ9QXBp';
  @override
  Widget build(BuildContext context) {
    return ref.watch(trendingMoviesProvider).when(
          data: (movies) {
            return Scaffold(
              backgroundColor: Common.backGroundColor,
              appBar: AppBar(elevation: 0, actions: [
                IconButton(
                    onPressed: () => showSearch(
                        context: context,
                        delegate: SearchMovieDelegate(ref: ref)),
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ))
              ]),
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Trend With Movies..",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Welcome Username,",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(randomphoto),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 400,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final movie = movies![index];
                              return BigCard(
                                movie: movie,
                              );
                            },
                            itemCount: movies!.length,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          error: (error, stackTrace) => ErrorText(error: error.toString()),
          loading: () {
            return Loader();
          },
        );
  }
}
