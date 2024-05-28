import 'package:flutter_landing_page/router/route_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    String pageRoute = '/:page';

    router.define(pageRoute, handler: homeHandler);
    router.notFoundHandler = homeHandler;
  }
}
