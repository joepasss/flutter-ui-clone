// ignore_for_file: avoid_print

import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            floating: false,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            backgroundColor: Colors.white,
            title: const Text(
              'facebook',
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            actions: [
              CircleButton(
                icon: Icons.search,
                iconSize: 30.0,
                onPressed: () => print('search'),
              ),
              CircleButton(
                icon: MdiIcons.facebookMessenger,
                iconSize: 30.0,
                onPressed: () => print('Messenger'),
              ),
            ],
          ),
          const SliverToBoxAdapter(
            child: CreatePostContainer(currentUser: currentUser),
          ),
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Rooms(onlineUsers: onlineUsers),
            ),
          ),
          SliverToBoxAdapter(
            child: Stories(
              currentUser: currentUser,
              stories: stories,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final Post post = posts[index];
                return PostContainer(post: post);
              },
              childCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }
}
