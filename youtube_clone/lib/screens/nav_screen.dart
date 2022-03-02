import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';

import '../data.dart';

import './home_screen.dart';

final selectedVideoProvider = StateProvider<Video?>((ref) => null);
final miniPlayerControllerProvider =
    StateProvider<MiniplayerController>((ref) => MiniplayerController());

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  static const double _playerMinHeight = 60.0;
  int _selectedIndex = 0;

  final _screens = [
    HomeScreen(),
    const Scaffold(body: Center(child: Text('EXPLORE'))),
    const Scaffold(body: Center(child: Text('ADD'))),
    const Scaffold(body: Center(child: Text('SUBSCRIPTION'))),
    const Scaffold(body: Center(child: Text('LIBRARY'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: ((context, watch, child) {
          final selectedVideo = watch(selectedVideoProvider).state;
          final miniPlayerController =
              watch(miniPlayerControllerProvider).state;

          return Stack(
            children: _screens
                .asMap()
                .map((index, screen) => MapEntry(
                    index,
                    Offstage(
                      child: screen,
                      offstage: _selectedIndex != index,
                    )))
                .values
                .toList()
              ..add(
                Offstage(
                  offstage: selectedVideo == null,
                  child: Miniplayer(
                    controller: miniPlayerController,
                    minHeight: _playerMinHeight,
                    maxHeight: MediaQuery.of(context).size.height * 0.75,
                    builder: (height, percentage) {
                      if (selectedVideo == null) return const SizedBox.shrink();

                      if (height <= _playerMinHeight + 50)
                        return Container(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: Row(
                            children: [
                              Image.network(
                                selectedVideo.thumbnailUrl,
                                height: _playerMinHeight - 4.0,
                                width: 120.0,
                                fit: BoxFit.cover,
                              ),
                              Expanded(
                                child: Text(
                                  'EXPANDED',
                                  style: TextStyle(),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.play_arrow,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  context.read(selectedVideoProvider).state =
                                      null;
                                },
                                icon: Icon(
                                  Icons.close,
                                ),
                              ),
                            ],
                          ),
                        );
                      return Container(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      );
                    },
                  ),
                ),
              ),
          );
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() {
          _selectedIndex = i;
        }),
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outlined),
            activeIcon: Icon(Icons.add_circle),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_outlined),
            activeIcon: Icon(Icons.subscriptions),
            label: 'Subscription',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined),
            activeIcon: Icon(Icons.video_library),
            label: 'Library',
          ),
        ],
      ),
    );
  }
}
