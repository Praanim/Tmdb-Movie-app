import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:api_with_riverpod/backend/models/getVideoModel.dart';
import 'package:api_with_riverpod/backend/services/services.dart';

class VideoCard extends StatefulWidget {
  final WidgetRef ref;
  final String videoUrl;
  const VideoCard({
    Key? key,
    required this.ref,
    required this.videoUrl,
  }) : super(key: key);

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = YoutubePlayerController(
        initialVideoId: widget.videoUrl,
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: true,
          isLive: false,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: YoutubePlayer(
        controller: _controller!,
        showVideoProgressIndicator: true,
        bottomActions: [
          CurrentPosition(),
          ProgressBar(
            isExpanded: true,
          ),
          const PlaybackSpeedButton()
        ],
      ),
    );
  }
}
