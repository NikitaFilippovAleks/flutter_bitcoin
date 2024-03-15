import 'dart:async';

import 'package:bitcoin/repositories/crypto_coins/crypto_coins.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'crypto_coin_event.dart';
part 'crypto_coin_state.dart';

class CryptoCoinBloc extends Bloc<CryptoCoinEvent, CryptoCoinState> {
  final AbstractCoinsRepository coinsRepository;

  CryptoCoinBloc(this.coinsRepository) : super(CryptoCoinInitial()) {
    on<LoadCryptoCoin>((event, emit) async {
      if (state is! CryptoCoinLoaded) {
        emit(CryptoCoinLoading());
      }

      try {
        final coin = await coinsRepository.getCoin(event.currencyCode);
        emit(CryptoCoinLoaded(coin: coin));
      } catch (e, st) {
        emit(CryptoCoinLoadingFailure(exception: e));
        GetIt.I<Talker>().handle(e, st);
      } finally {
        event.completer?.complete();
      }
    });
  }
}
