import 'package:flutter/material.dart';
import 'package:landing_page/provider/page_provider.dart';
import 'package:landing_page/ui/shared/custom_app_menu.dart';
import 'package:landing_page/ui/views/about_view.dart';
import 'package:landing_page/ui/views/contact_view.dart';
import 'package:landing_page/ui/views/home_view.dart';
import 'package:landing_page/ui/views/location_view.dart';
import 'package:landing_page/ui/views/pricing_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: builBoxDecoration(),
        child: Stack(
          children: [

            _HomeBody(),

            Positioned(
              right: 20,
              top: 20,
              child: CustomAppMenu(),
            ),

          ],
        ),
      ),
    );
  }

  BoxDecoration builBoxDecoration() => const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.pink,
        Colors.redAccent
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.5, 0.5],
    ),
  );
}

class _HomeBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    return PageView(
      controller: pageProvider.scrollController,
      scrollDirection: Axis.vertical,
      children: [

        HomeView(),
        AboutView(),
        PricingView(),
        ContactView(),
        LocationView(),

      ],
    );
  }
}