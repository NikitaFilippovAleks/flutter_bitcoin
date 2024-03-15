import 'dart:async';

import 'package:bitcoin/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:bitcoin/repositories/crypto_coins/models/crypto_coin_details.dart';
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
      final hight24Hour = usdData['HIGH24HOUR'];
      final low24Hours = usdData['LOW24HOUR'];

      return CryptoCoin(
        name: e.key,
        details: CryptoCoinDetails(
          priceInUSD: price,
          imageUrl: 'https://www.cryptocompare.com$imageUrl',
          hight24Hour: hight24Hour,
          low24Hours: low24Hours
        ),
      );
    }).toList();

    return cryptoCoinsList;
  }

  Future<CryptoCoin> getCoin(String currencyCode) async {
    final response = await dio.get('https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');
    final data = response.data['RAW'] as Map<String, dynamic>;
    final currencyData = data[currencyCode];
    final usdData = currencyData['USD'];
    final price = usdData['PRICE'];
    final imageUrl = usdData['IMAGEURL'];
    final hight24Hour = usdData['HIGH24HOUR'];
    final low24Hours = usdData['LOW24HOUR'];

    return CryptoCoin(
      name: currencyCode,
      details: CryptoCoinDetails(
        priceInUSD: price,
        imageUrl: 'https://www.cryptocompare.com$imageUrl',
        hight24Hour: hight24Hour,
        low24Hours: low24Hours
      ),
    );
  }
}
