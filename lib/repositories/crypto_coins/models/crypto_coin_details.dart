import 'package:equatable/equatable.dart';

class CryptoCoinDetails extends Equatable {
  final double priceInUSD;
  final String imageUrl;
  final double hight24Hour;
  final double low24Hours;

  const CryptoCoinDetails({
    required this.priceInUSD,
    required this.imageUrl,
    required this.hight24Hour,
    required this.low24Hours,
  });
  
  @override
  List<Object> get props => [
    priceInUSD,
    imageUrl,
    hight24Hour,
    low24Hours
  ];
}
