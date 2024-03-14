import 'package:bitcoin/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'abstract_coins_repository.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  final Dio dio;

  CryptoCoinsRepository({required this.dio});

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get('https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,AID,CAG,DOV&tsyms=USD');
    // debugPrint(response.toString());

    final data = response.data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = data.entries.map((e) {
      final usdData = (e.value as Map<String, dynamic>)['USD'];
      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];

      return CryptoCoin(
        name: e.key,
        priceInUSD: price,
        imageUrl: 'https://www.cryptocompare.com$imageUrl'
      );
    }).toList();

    return cryptoCoinsList;
  }
}
