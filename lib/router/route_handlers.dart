import 'package:fluro/fluro.dart';
import 'package:flutter_landing_page/ui/pages/home_page.dart';

final Handler homeHandler = Handler(
  handlerFunc: (context, parameters) {
    return const HomePage();
  },
);
