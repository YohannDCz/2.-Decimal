import 'package:decimal/config/theme.dart';
import 'package:decimal/screens/home/profile.dart';
import 'package:decimal/screens/home/widgets/main_feed.dart';
import 'package:decimal/screens/home/widgets/pics.dart';
import 'package:decimal/screens/home/widgets/posts.dart';
import 'package:decimal/screens/home/widgets/search_tab_bar.dart';
import 'package:decimal/screens/home/widgets/stories.dart';
import 'package:decimal/screens/home/widgets/videos.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> with SingleTickerProviderStateMixin {
  String type = 'videos';

  final ScrollController _scrollController = ScrollController();
  late TabController _tabController;
  bool _displayTabBar = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    const positionTabBar = 238.0; // Position en pixels à laquelle afficher la TabBar
    if (_scrollController.position.pixels >= positionTabBar && !_displayTabBar) {
      setState(() => _displayTabBar = true);
    } else if (_scrollController.position.pixels < positionTabBar && _displayTabBar) {
      setState(() => _displayTabBar = false);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TabBarView(
          controller: _tabController,
          children: [
            MainFeed(scrollController: _scrollController, type: type),
            Stories(scrollController: _scrollController),
            Videos(scrollController: _scrollController),
            Pics(scrollController: _scrollController),
            Posts(scrollController: _scrollController),
          ],
        ),
        SearchTabBar(
          afficherTabBar: _displayTabBar,
          tabController: _tabController,
        ),
      ],
    );
  }
}