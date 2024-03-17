import 'dart:async';

import 'package:bitcoin/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:bitcoin/repositories/crypto_coins/models/crypto_coin_details.dart';
import 'package:dio/dio.dart';

import 'abstract_coins_repository.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  final Dio dio;

  CryptoCoinsRepository({required this.dio});

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
      'data/pricemultifull',
      queryParameters: {
        'fsyms': 'BTC,ETH,BNB,SOL,AID,CAG,DOV',
        'tsyms': 'USD'
      }
    );

    final data = response.data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = data.entries.map((e) {
      final usdData = (e.value as Map<String, dynamic>)['USD'];

      return CryptoCoin(
        name: e.key,
        details: CryptoCoinDetails.fromJson(usdData)
      );
    }).toList();

    return cryptoCoinsList;
  }

  Future<CryptoCoin> getCoin(String currencyCode) async {
    final response = await dio.get(
      'data/pricemultifull',
      queryParameters: {
        'fsyms': currencyCode,
        'tsyms': 'USD'
      }
    );
    final data = response.data['RAW'] as Map<String, dynamic>;
    final currencyData = data[currencyCode];
    final usdData = currencyData['USD'];

    return CryptoCoin(
      name: currencyCode,
      details: CryptoCoinDetails.fromJson(usdData)
    );
  }
}
