import 'package:decimal/config/theme.dart';
import 'package:decimal/screens/home/feed/widgets/feed_stories.dart';
import 'package:flutter/material.dart';

import 'main_feed_publications.dart';

class MainFeed extends StatefulWidget {
  const MainFeed({super.key, required ScrollController scrollController, required searchBarfocusNode})
      : _scrollController = scrollController,
        _searchBarFocusNode = searchBarfocusNode;

  final ScrollController _scrollController;
  final FocusNode _searchBarFocusNode;

  @override
  State<MainFeed> createState() => _MainFeedState();
}

class _MainFeedState extends State<MainFeed> {
  String type = 'videos';

  void _scrollToPosition() {
    widget._scrollController.animateTo(
      238.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  final FocusNode searchBarFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget._scrollController,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 66.0, right: 16.0),
              child: Icon(Icons.photo_camera, size: 24.0, color: AppColors.accent3),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0, bottom: 56.0),
              child: Image.asset('assets/images/logotype.png', width: 189.0, height: 46.0),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 345.0,
              height: 48.0,
              child: TextField(
                focusNode: searchBarFocusNode,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: "What's new with you ? ...",
                  labelStyle: Theme.of(context).primaryTextTheme.labelLarge!.copyWith(color: AppColors.accent3),
                  prefixIcon: Icon(Icons.arrow_downward, color: AppColors.accent3, size: 24.0),
                  suffixIcon: Icon(Icons.search, color: AppColors.accent3, size: 24.0),
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(99.0),
                    borderSide: BorderSide(color: AppColors.accent3, width: 4.0, style: BorderStyle.solid),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(99.0),
                    borderSide: BorderSide(color: AppColors.accent3, width: 4.0, style: BorderStyle.solid),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(99.0),
                    borderSide: BorderSide(color: AppColors.accent3, width: 4.0, style: BorderStyle.solid),
                  ),
                ),
                onTap: () {
                  _scrollToPosition();
                  searchBarFocusNode.unfocus();
                  widget._searchBarFocusNode.requestFocus();
                },
              ),
            ),
          ),
          const FeedStories(),
          const FeedPublications(),
        ],
      ),
    );
  }
}
