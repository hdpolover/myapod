import 'package:apod_app/constants.dart';
import 'package:apod_app/presentation/screens/discover.dart';
import 'package:apod_app/presentation/screens/favorites.dart';
import 'package:apod_app/presentation/screens/home.dart';
import 'package:apod_app/presentation/screens/info.dart';
import 'package:apod_app/presentation/screens/search.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
          builder: (_) => Home(),
        );
      case discoverRoute:
        return MaterialPageRoute(
          builder: (_) => Discover(),
        );
      case searchRoute:
        return MaterialPageRoute(
          builder: (_) => Search(),
        );
      case favoritesRoute:
        return MaterialPageRoute(
          builder: (_) => Favorites(),
        );
      case infoRoute:
        return MaterialPageRoute(
          builder: (_) => Info(),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
