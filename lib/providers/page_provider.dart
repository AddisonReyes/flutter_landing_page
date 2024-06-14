import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  PageController _scrollController = PageController();
  int _currentIndex = 0;
  final List<String> _pages = [
    'home',
    'about',
    'pricing',
    'contact',
    'location'
  ];

  PageController get scrollController => _scrollController;
  List<String> get pages => _pages;

  void createScrollController(String routeName) {
    int idx = getPageIndex(routeName);

    _scrollController = PageController(initialPage: idx);
    html.document.title = _pages[idx];

    _scrollController.addListener(() {
      final pageIndex = (scrollController.page ?? 0).round();

      if (pageIndex != _currentIndex) {
        html.window.history.pushState(null, 'none', '#/${_pages[pageIndex]}');
        html.document.title = _pages[pageIndex];
        _currentIndex = pageIndex;
      }
    });
  }

  int getPageIndex(String routeName) {
    return !_pages.contains(routeName) ? 0 : _pages.indexOf(routeName);
  }

  void goTo(int index) {
    scrollController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
