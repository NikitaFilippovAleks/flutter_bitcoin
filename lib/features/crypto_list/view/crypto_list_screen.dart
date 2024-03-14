import 'dart:async';

import 'package:bitcoin/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:bitcoin/features/crypto_list/widgets/widgets.dart';
import 'package:bitcoin/repositories/crypto_coins/crypto_coins.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          final completer = Completer();
          _cryptoListBloc.add(LoadCryptoList( completer: completer ));
          
          return completer.future;
        },
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if (state is CryptoListLoaded) {
              return ListView.separated(
                itemCount: state.coinsList.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: ((context, index) => CryptoCoinTile(coin: state.coinsList[index]))
              );
            }

            if (state is CryptoListLoadingFailure) {
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
                        _cryptoListBloc.add(LoadCryptoList());
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
      ) 
      // _cryptoCoins == null
      //   ? const Center(child: CircularProgressIndicator())
      //   : ListView.separated(
      //     itemCount: _cryptoCoins!.length,
      //     separatorBuilder: (context, index) => Divider(),
      //     itemBuilder: ((context, index) => CryptoCoinTile(coin: _cryptoCoins![index]))
      //   ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.download),
      //   onPressed: () async {
      //     await _loadCryptoCoins();
      //   },
      // ),
    );
  }
}
