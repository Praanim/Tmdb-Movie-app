import 'package:api_with_riverpod/controller/services_controller.dart';
import 'package:api_with_riverpod/core/error_text.dart';
import 'package:api_with_riverpod/core/loader.dart';
import 'package:api_with_riverpod/ui/components/video_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class YoutubePlayerCard extends ConsumerStatefulWidget {
  final String movid;
  YoutubePlayerCard({
    required this.movid,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _YoutubePlayerCardState();
}

class _YoutubePlayerCardState extends ConsumerState<YoutubePlayerCard> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(videoUrlsProvider(widget.movid)).when(
          data: (videoUrl) {
            if (videoUrl == null) {
              return Container();
            }
            return VideoCard(
              ref: ref,
              videoUrl: videoUrl,
            );
          },
          error: (error, stackTrace) => ErrorText(error: error.toString()),
          loading: () {
            return Loader();
          },
        );
  }
}
