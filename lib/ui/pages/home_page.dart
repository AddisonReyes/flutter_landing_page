import 'package:flutter/material.dart';

import 'package:flutter_landing_page/ui/shared/custom_app_menu.dart';
import 'package:flutter_landing_page/ui/views/location_view.dart';
import 'package:flutter_landing_page/ui/views/contact_view.dart';
import 'package:flutter_landing_page/ui/views/pricing_view.dart';
import 'package:flutter_landing_page/ui/views/about_view.dart';
import 'package:flutter_landing_page/ui/views/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: buildBoxDecoration(),
        child: const Stack(
          children: [
            _HomeBody(),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomAppMenu(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.pink,
          Colors.purpleAccent,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.5, 0.5],
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: const [
        HomeView(),
        AboutView(),
        PricingView(),
        ContactView(),
        LocationView(),
      ],
    );
  }
}
