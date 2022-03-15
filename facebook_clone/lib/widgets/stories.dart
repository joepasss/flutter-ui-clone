import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../models/story_model.dart';

class Stories extends StatelessWidget {
  const Stories({
    Key? key,
    required this.currentUser,
    required this.stories,
  }) : super(key: key);

  final User currentUser;
  final List<Story> stories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _StroyAddCard(
                currentUser: currentUser,
              ),
            );
          }

          final Story story = stories[index - 1];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: _StoryCard(story: story),
          );
        },
      ),
    );
  }
}

class _StroyAddCard extends StatelessWidget {
  const _StroyAddCard({Key? key, required this.currentUser}) : super(key: key);

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: currentUser.imageUrl,
            height: double.infinity,
            width: 110.0,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: Container(
            height: 40.0,
            width: 40.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.add),
              color: Palette.facebookBlue,
              iconSize: 30.0,
            ),
          ),
        ),
        const Positioned(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
          child: Text(
            'Add to Story',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard({Key? key, required this.story}) : super(key: key);

  final Story story;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: story.imageUrl,
            height: double.infinity,
            width: 110.0,
            fit: BoxFit.cover,
          ),
        ),
        ProfileAvatar(
          imageUrl: story.imageUrl,
          hasBorder: !story.isViewed,
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
          child: Text(
            story.user.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
