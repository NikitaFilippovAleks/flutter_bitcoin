// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCoinDetails _$CryptoCoinDetailsFromJson(Map<String, dynamic> json) =>
    CryptoCoinDetails(
      priceInUSD: (json['PRICE'] as num).toDouble(),
      imageUrl: json['IMAGEURL'] as String,
      high24Hour: (json['HIGH24HOUR'] as num).toDouble(),
      low24Hours: (json['LOW24HOUR'] as num).toDouble(),
      lastUpdate:
          CryptoCoinDetails._dateTimeFromJson(json['LASTUPDATE'] as int),
    );

Map<String, dynamic> _$CryptoCoinDetailsToJson(CryptoCoinDetails instance) =>
    <String, dynamic>{
      'PRICE': instance.priceInUSD,
      'IMAGEURL': instance.imageUrl,
      'HIGH24HOUR': instance.high24Hour,
      'LOW24HOUR': instance.low24Hours,
      'LASTUPDATE': CryptoCoinDetails._dateTimeToJson(instance.lastUpdate),
    };
