import 'dart:async';

import 'package:bitcoin/features/crypto_coin/bloc/crypto_coin_bloc.dart';
import 'package:bitcoin/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:bitcoin/features/crypto_coin/widgets/widgets.dart';

class CryptoCoinScreen extends StatefulWidget {
  final String coinName;

  const CryptoCoinScreen({super.key, required this.coinName});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  final _cryptoCoin = CryptoCoinBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoCoin.add(LoadCryptoCoin(currencyCode: widget.coinName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        // triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: () {
          final completer = Completer();
          _cryptoCoin.add(LoadCryptoCoin(currencyCode: widget.coinName, completer: completer));
          return completer.future;
        },
        child: BlocBuilder<CryptoCoinBloc, CryptoCoinState>(
          bloc: _cryptoCoin,
          builder: (context, state) {
            if (state is CryptoCoinLoaded) {
              final coinDetails = state.coin.details;

              return CustomScrollView(
                slivers: <Widget>[
                  SliverFillRemaining(
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1.7,
                          child: Image.network(coinDetails.imageUrl),
                        ),
                        SizedBox(height: 16,),
                        Text(
                          state.coin.name,
                          style: theme.textTheme.headlineLarge,
                        ),
                        SizedBox(height: 16,),
                        DarkCard(
                          child: Center(child: Text('${coinDetails.priceInUSD.toStringAsFixed(3)} \$'),)
                        ),
                        SizedBox(height: 10,),
                        DarkCard(
                          child: Column(
                            children: [
                              _DataRow(
                                title: 'Hight 24 Hour',
                                value: '${coinDetails.hight24Hour.toStringAsFixed(3)} \$',
                              ),
                              SizedBox(height: 6,),
                              _DataRow(
                                title: 'Low 24 Hour',
                                value: '${coinDetails.low24Hours.toStringAsFixed(3)} \$',
                              ),
                            ],
                          )
                        ),
                      ],
                    ),
                  )
                ],
              );
            }

            if (state is CryptoCoinLoadingFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Something went wrong',
                      style: theme.textTheme.headlineMedium
                    ),
                    Text(
                      'Please try again later',
                      style: theme.textTheme.labelSmall
                    ),
                    SizedBox(height: 20,),
                    TextButton(
                      onPressed: () {
                        _cryptoCoin.add(LoadCryptoCoin(currencyCode: widget.coinName));
                      },
                      child: Text('Try again')
                    )
                  ],
                )
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class _DataRow extends StatelessWidget {
  final String title;
  final String value;

  const _DataRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.textTheme.bodySmall,  
        ),
        Text(
          value,
          style: theme.textTheme.bodySmall,
        )
      ],
    );
  }
}
