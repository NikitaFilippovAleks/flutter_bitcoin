import 'package:bitcoin/features/crypto_coin/view/view.dart';
import 'package:bitcoin/features/crypto_list/view/view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

@TypedGoRoute<CryptoListScreenRoute>(
    path: '/',
    routes: [
      TypedGoRoute<CryptoCoinRoute>(
        path: 'coin/:coinName',
      )
    ]
)
@immutable
class CryptoListScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CryptoListScreen(title: 'Crypto list');
  }
}

@immutable
class CryptoCoinRoute extends GoRouteData {
  final String coinName;

  const CryptoCoinRoute({
    required this.coinName,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CryptoCoinScreen(coinName: coinName);
  }
}
