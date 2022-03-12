import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart';
import '../models/user_model.dart';

class Rooms extends StatelessWidget {
  const Rooms({
    Key? key,
    required this.onlineUsers,
  }) : super(key: key);

  final List<User> onlineUsers;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: _CreateRoomButton(),
            );
          }

          final User user = onlineUsers[index - 1];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ProfileAvatar(
              imageUrl: user.imageUrl,
              isActive: true,
            ),
          );
        },
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: ButtonStyle(
        side: MaterialStateProperty.resolveWith<BorderSide>(
          (states) => const BorderSide(color: Colors.blueAccent, width: 3.0),
        ),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (_) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            );
          },
        ),
        textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (states) => const TextStyle(
            color: Palette.facebookBlue,
          ),
        ),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: const Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4.0),
          const Text('Create\nRoom'),
        ],
      ),
    );
  }
}
