import 'package:api_with_riverpod/controller/services_controller.dart';
import 'package:api_with_riverpod/core/error_text.dart';
import 'package:api_with_riverpod/core/loader.dart';
import 'package:api_with_riverpod/ui/components/common.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/flutter_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchMovieDelegate extends SearchDelegate {
  String errorImage =
      'https://imgs.search.brave.com/MNh81s44GXgzDYPJq04aOFp7cYgWJNSegFtrNGGVI1w/rs:fit:592:225:1/g:ce/aHR0cHM6Ly90c2Ux/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC43/X1ZNX29QenJrSEtP/ZXJid0dKODhnSGFG/NyZwaWQ9QXBp';
  String loadingImage =
      'https://imgs.search.brave.com/zdvfEUhbNiOjjqmu69hdou_Zm5VwM7JQQHcnZdbiaAA/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly9zdGF0/aWMudmVjdGVlenku/Y29tL3N5c3RlbS9y/ZXNvdXJjZXMvcHJl/dmlld3MvMDAwLzU4/Mi8wNzEvb3JpZ2lu/YWwvbG9hZGluZy1i/YXItaWNvbi12ZWN0/b3ItaWxsdXN0cmF0/aW9uLmpwZw';
  final WidgetRef ref;

  SearchMovieDelegate({
    required this.ref,
  });
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return ref.watch(searchDetailsProvider(query)).when(
          data: (results) {
            if (results == null) {
              return Center(
                  child: Text(
                "No movies found of respective search",
                style: TextStyle(color: Colors.black),
              ));
            }
            return Scaffold(
              body: Card(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final result = results[index];
                    return ListTile(
                      title: Text(
                        result.originalTitle,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                    // return Row(
                    //   mainAxisSize: MainAxisSize.min,
                    //   children: [
                    //     Container(
                    //         height: 150,
                    //         width: 100,
                    //         child: CachedNetworkImage(
                    //             imageUrl: 'https://image.tmdb.org/t/p/w500' +
                    //                 result.posterPath,
                    //             fit: BoxFit.cover,
                    //             placeholder: (context, url) => Center(
                    //                   child: CircularProgressIndicator(),
                    //                 ),
                    //             errorWidget: (context, url, error) =>
                    //                 Center(child: const Icon(Icons.error)))),
                    //     Expanded(
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         children: [
                    //           Text(
                    //             result.originalTitle,
                    //             style: TextStyle(
                    //                 // color: Colors.white,
                    //                 fontSize: 20,
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //           SizedBox(
                    //             height: 20,
                    //           ),
                    //           Row(
                    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //             children: result.genreIds
                    //                 .map((int id) => Text(id.toString()))
                    //                 .toList(),
                    //           )
                    //         ],
                    //       ),
                    //     )
                    //   ],
                    // );
                  },
                  itemCount: results.length,
                ),
              ),
            );
          },
          error: (error, stackTrace) {
            return ErrorText(error: error.toString());
          },
          loading: () => Loader(),
        );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == '') {
      return Container();
    }
    return ref.watch(searchDetailsProvider(query)).when(
          data: (results) {
            if (results == null) {
              return Container(
                child: Text("No movies found of respective search"),
              );
            }
            return Scaffold(
              body: Card(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final result = results[index];
                    return ListTile(
                      title: Text(
                        result.originalTitle,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                    // return Row(
                    //   mainAxisSize: MainAxisSize.min,
                    //   children: [
                    //     Container(
                    //         height: 150,
                    //         width: 100,
                    //         child: CachedNetworkImage(
                    //             imageUrl: 'https://image.tmdb.org/t/p/w500' +
                    //                 result.posterPath,
                    //             fit: BoxFit.cover,
                    //             placeholder: (context, url) => Center(
                    //                   child: CircularProgressIndicator(),
                    //                 ),
                    //             errorWidget: (context, url, error) =>
                    //                 Center(child: const Icon(Icons.error)))),
                    //     Expanded(
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         children: [
                    //           Text(
                    //             result.originalTitle,
                    //             style: TextStyle(
                    //                 // color: Colors.white,
                    //                 fontSize: 20,
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //           SizedBox(
                    //             height: 20,
                    //           ),
                    //           Row(
                    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //             children: result.genreIds
                    //                 .map((int id) => Text(id.toString()))
                    //                 .toList(),
                    //           )
                    //         ],
                    //       ),
                    //     )
                    //   ],
                    // );
                  },
                  itemCount: results.length,
                ),
              ),
            );
          },
          error: (error, stackTrace) {
            return ErrorText(error: error.toString());
          },
          loading: () => Loader(),
        );
  }
}
