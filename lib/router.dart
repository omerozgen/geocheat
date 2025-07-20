import 'package:flutter/material.dart';
import 'features/home/screens/home/home_screen.dart';

final router = RouterConfig(
  routeInformationParser: const _DummyParser(),
  routerDelegate: _HomeDelegate(),
);

class _DummyParser extends RouteInformationParser<RouteInformation> {
  const _DummyParser();
  @override
  Future<RouteInformation> parseRouteInformation(
    RouteInformation routeInformation,
  ) async => routeInformation;
}

class _HomeDelegate extends RouterDelegate<RouteInformation>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteInformation> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  RouteInformation? get currentConfiguration =>
      const RouteInformation(location: '/');

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: const [MaterialPage(child: HomeScreen())],
      onPopPage: (route, result) => route.didPop(result),
    );
  }

  @override
  Future<void> setNewRoutePath(RouteInformation configuration) async {}
}
