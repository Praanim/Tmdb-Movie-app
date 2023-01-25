import 'package:api_with_riverpod/controller/services_controller.dart';
import 'package:api_with_riverpod/core/error_text.dart';
import 'package:api_with_riverpod/core/loader.dart';
import 'package:api_with_riverpod/ui/components/big_mov_card.dart';
import 'package:api_with_riverpod/ui/components/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final String randomphoto =
      'https://scontent.fktm7-1.fna.fbcdn.net/v/t39.30808-6/312399827_1311814562690321_94348874669166429_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=nm_0Z9U_aU0AX-sLZXl&tn=_5ZE5ItnwGE_U7lh&_nc_ht=scontent.fktm7-1.fna&oh=00_AfBJUcZWMSE3S7sfhiVMQ82bggVxt2U9Askue_G7PH51VA&oe=63CFB66B';
  @override
  Widget build(BuildContext context) {
    return ref.watch(trendingMoviesProvider).when(
          data: (movies) {
            return Scaffold(
              backgroundColor: Common.backGroundColor,
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
