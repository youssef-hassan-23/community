library route_pages;

import 'package:flutter/material.dart';

import '../error/failure.dart';
import 'routes.dart';

class AppRoute {
  static const initial = RoutesName.initial;
  static Route<dynamic> generate(RouteSettings? settings) {
    switch (settings?.name) {
      case RoutesName.initial:
      // return const PageFadeTransition(child: HomePage()).build;

      default:
        // If there is no such named route in the switch statement
        throw CacheFailure(errorMessage: 'Route not found!');
    }
  }
}
