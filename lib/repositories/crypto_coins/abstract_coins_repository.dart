import 'models/models.dart';

abstract class AbstractCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList();
  Future<CryptoCoin> getCoin(String currencyCode);
}
