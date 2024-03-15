import 'package:bitcoin/features/crypto_coin/crypto_coin.dart';
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
    final coinDetails = coin.details;

    return ListTile(
      leading: Image.network(coinDetails.imageUrl),
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
        '${coinDetails.priceInUSD.toStringAsFixed(2)} \$',
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CryptoCoinScreen(coinName: coin.name))
        );
        // Navigator.of(context).pushNamed(
        //   '/coins',
        //   arguments: coin.name
        // );
      },
    );
  }
}
