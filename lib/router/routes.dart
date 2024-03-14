import 'package:bitcoin/features/crypto_coin/crypto_coin.dart';
import 'package:bitcoin/features/crypto_list/crypto_list.dart';

final routes = {
  '/': (context) => const CryptoListScreen(title: 'Crypto list'),
  '/coins': (context) => const CryptoCoinScreen()
};
