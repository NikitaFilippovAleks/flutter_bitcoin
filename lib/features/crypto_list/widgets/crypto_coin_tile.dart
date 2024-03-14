import 'package:bitcoin/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Image.network(coin.imageUrl),
      // SvgPicture.asset(
      //   'assets/svg/bitcoin_logo.svg',
      //   height: 30,
      //   width: 30,
      // ),
      title: Text(
        coin.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '${coin.priceInUSD.toStringAsFixed(2)} \$',
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coins',
          arguments: coin.name
        );
      },
    );
  }
}
