// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $cryptoListScreenRoute,
    ];

RouteBase get $cryptoListScreenRoute => GoRouteData.$route(
      path: '/',
      factory: $CryptoListScreenRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'coin/:coinName',
          factory: $CryptoCoinRouteExtension._fromState,
        ),
      ],
    );

extension $CryptoListScreenRouteExtension on CryptoListScreenRoute {
  static CryptoListScreenRoute _fromState(GoRouterState state) =>
      CryptoListScreenRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CryptoCoinRouteExtension on CryptoCoinRoute {
  static CryptoCoinRoute _fromState(GoRouterState state) => CryptoCoinRoute(
        coinName: state.pathParameters['coinName']!,
      );

  String get location => GoRouteData.$location(
        '/coin/${Uri.encodeComponent(coinName)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
