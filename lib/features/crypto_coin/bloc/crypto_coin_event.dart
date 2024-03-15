part of 'crypto_coin_bloc.dart';

abstract class CryptoCoinEvent extends Equatable {}

class LoadCryptoCoin extends CryptoCoinEvent {
  final String currencyCode;
  final Completer? completer;

  LoadCryptoCoin({ required this.currencyCode, this.completer });

  @override
  List<Object?> get props => [currencyCode, completer];
}
