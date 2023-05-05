import 'package:flutter/material.dart';
import 'package:seenit/common/widgets/custom_post_body.dart';
import 'package:seenit/features/details_screen/details_screen.dart';
import 'package:seenit/features/home/home_screen.dart';
import 'package:seenit/features/search/search_screen.dart';

import 'features/account/screens/login_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen(),
      );

    case HomePage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomePage(),
      );
    case SearchScreen.routeName:
      var searchTerm = routeSettings.arguments.toString();
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(searchTerm: searchTerm),
      );
    case FullScreen.routeName:
      List<dynamic> imagesUrl = routeSettings.arguments as List;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => FullScreen(imagesUrl: imagesUrl),
      );
    case DetailsScreen.routeName:
      List<dynamic> postDetails = routeSettings.arguments as List;

      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => DetailsScreen(
          postDetails: postDetails[0],
          isSearchResult: postDetails[1],
        ),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Such a page doesnot exist'),
          ),
        ),
      );
  }
}
