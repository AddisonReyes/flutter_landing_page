import 'package:fluro/fluro.dart';
import 'package:flutter_landing_page/providers/page_provider.dart';
import 'package:flutter_landing_page/ui/pages/home_page.dart';
import 'package:provider/provider.dart';

final Handler homeHandler = Handler(
  handlerFunc: (context, parameters) {
    final pageProvider = Provider.of<PageProvider>(context!, listen: false);
    final page = parameters['page']!.first;

    if (page != '/') {
      pageProvider.createScrollController(page);
      return const HomePage();
    }

    return null;
  },
);
