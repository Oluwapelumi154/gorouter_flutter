import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter_flutter/projects/routes/app_route_constant.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Column(
        children: [
          Container(
            child: Center(child: Text('centers')),
          ),
          ElevatedButton(
              onPressed: () {
                GoRouter.of(context)
                    .pushNamed(MyAppRouteConstant.aboutRouteName);
              },
              child: Text('About US')),
          ElevatedButton(
              onPressed: () {
                GoRouter.of(context)
                    .pushNamed(MyAppRouteConstant.contactRouteName);
              },
              child: Text('Profile Page')),
          ElevatedButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(
                    MyAppRouteConstant.profileRouteName,
                    pathParameters: {"username": "Oluwapelumi"});
              },
              child: Text('Contact US'))
        ],
      ),
    );
  }
}
