import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter_flutter/pages/about.dart';
import 'package:gorouter_flutter/pages/contact_us.dart';
import 'package:gorouter_flutter/pages/error_page.dart';
import 'package:gorouter_flutter/pages/home.dart';
import 'package:gorouter_flutter/pages/profile.dart';
import 'package:gorouter_flutter/projects/routes/app_route_constant.dart';

class MyAppRouter {
  final bool isAuth;
  late final GoRouter router;

  MyAppRouter({required this.isAuth}) {
    router = GoRouter(
      routes: [
        GoRoute(
            path: '/',
            name: MyAppRouteConstant.homeRouteName,
            pageBuilder: (context, state) => MaterialPage(child: Home())),
        GoRoute(
            path: '/about',
            name: MyAppRouteConstant.aboutRouteName,
            pageBuilder: (context, state) => MaterialPage(child: About())),
        GoRoute(
            path: '/profile/:username',
            name: MyAppRouteConstant.profileRouteName,
            pageBuilder: (context, state) => MaterialPage(
                    child: Profile(
                  username: state.pathParameters['username']!,
                ))),
        GoRoute(
            path: "/contact_us",
            name: MyAppRouteConstant.contactRouteName,
            pageBuilder: (context, state) => MaterialPage(child: ContactUs()))
      ],
      errorPageBuilder: (context, state) => MaterialPage(child: ErrorPage()),
      redirect: (context, state) {
        print(state.matchedLocation);
        if (!isAuth &&
            state.matchedLocation
                .startsWith('/${MyAppRouteConstant.profileRouteName}')) {
          return router.namedLocation(MyAppRouteConstant.contactRouteName);
        } else {
          return null;
        }
      },
    );
  }
}
