import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_details.g.dart';

@JsonSerializable()
class CryptoCoinDetails extends Equatable {
  @JsonKey(name: 'PRICE')
  final double priceInUSD;
  @JsonKey(name: 'IMAGEURL')
  final String imageUrl;
  @JsonKey(name: 'HIGH24HOUR')
  final double high24Hour;
  @JsonKey(name: 'LOW24HOUR')
  final double low24Hours;
  @JsonKey(name: 'LASTUPDATE', toJson: _dateTimeToJson, fromJson: _dateTimeFromJson)
  final DateTime lastUpdate;

  const CryptoCoinDetails({
    required this.priceInUSD,
    required this.imageUrl,
    required this.high24Hour,
    required this.low24Hours,
    required this.lastUpdate,
  });

  String get fullImageUrl => '${dotenv.env['IMAGE_HOST']}$imageUrl';

  factory CryptoCoinDetails.fromJson(Map<String, dynamic> json) => _$CryptoCoinDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$CryptoCoinDetailsToJson(this);

  static int _dateTimeToJson(DateTime time) => (time.millisecondsSinceEpoch / 1000).round();
  static DateTime _dateTimeFromJson(int seconds) {
    return DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
  }

  @override
  List<Object> get props => [
    priceInUSD,
    imageUrl,
    high24Hour,
    low24Hours
  ];
}
