import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'router/routes.dart';
import 'theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: $appRoutes,
      observers: [
        TalkerRouteObserver(GetIt.I<Talker>())
      ]
    );

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: darkTheme,
      routerConfig: router,
    );
  }
}
