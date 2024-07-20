import 'package:fashoo/component/profile_avatar.dart';
import 'package:fashoo/component/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

class PostComponent extends StatefulWidget {
  final List<PostMedia> media;

  PostComponent({required this.media});

  @override
  _PostComponentState createState() => _PostComponentState();
}

class _PostComponentState extends State<PostComponent> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileAvatar(
            nameColor: const Color(0xff000000),
            handleColor: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 10),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                PageView.builder(
                  itemCount: widget.media.length,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemBuilder: (context, index) {
                    final mediaItem = widget.media[index];
                    if (mediaItem.type == PostMediaType.image) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          image: DecorationImage(
                            image: NetworkImage(mediaItem.url),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    } else if (mediaItem.type == PostMediaType.video) {
                      return VideoPlayerWidget(url: mediaItem.url);
                    }
                    return Container();
                  },
                ),
                if (widget.media.length > 1)
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(widget.media.length, (index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.0),
                          width: _currentPage == index ? 9.0 : 9.0,
                          height: _currentPage == index ? 9.0 : 9.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? Theme.of(context).colorScheme.primary
                                : Colors.white.withOpacity(0.5),
                          ),
                        );
                      }),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 9),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Boxicons.bxs_heart,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      const SizedBox(width: 5),
                      const Text("45.0K"),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Row(
                    children: [
                      Icon(
                        Boxicons.bx_comment_dots,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      const SizedBox(width: 5),
                      const Text("45.0K"),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Row(
                    children: [
                      Icon(
                        Boxicons.bxl_telegram,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      const SizedBox(width: 5),
                      const Text("4K"),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Boxicons.bx_bookmark,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  const SizedBox(width: 5),
                  const Text("save"),
                ],
              ),
            ],
          ),
          const Text(
            "To match the design shown in the new image, you'll need to adjust the story item widget to have rounded rectangle shapes instead of circles and ensure the placement of the 'Live' indicator and the '+' icon for adding stories aligns with the design.",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

enum PostMediaType { image, video }

class PostMedia {
  final PostMediaType type;
  final String url;
  PostMedia({required this.type, required this.url});
}
