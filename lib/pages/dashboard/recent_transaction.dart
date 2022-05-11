import 'package:crypto_pay/constraints/themes.dart';
import 'package:crypto_pay/pages/wallet/global_tile.dart';
import 'package:flutter/material.dart';

class RecentTransaction extends StatelessWidget {
  const RecentTransaction({Key? key}) : super(key: key);

  Text getSuffixText({required String value, required bool isDebit}){
    return Text(
      value,
      style: TextStyle(
        fontSize: 14,
        color: isDebit?Themes.secondaryColor:Themes.primaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recent Transactions",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10,),
          GlobalTile(
            image: 'bitcoin.png',
            heading: 'Buy Bitcoin',
            content: 'Today',
            suffixText: getSuffixText(value: '-0.1 Eth', isDebit: true),
          ),
          const SizedBox(height: 8,),
          GlobalTile(
            image: 'bitcoin.png',
            heading: 'Sell Bitcoin',
            content: 'Today',
            suffixText: getSuffixText(value: '0.05 Eth', isDebit: false),
          ),
          const SizedBox(height: 8,),
          GlobalTile(
            image: 'bitcoin.png',
            heading: 'Sell Bitcoin',
            content: 'Today',
            suffixText: getSuffixText(value: '0.05 Eth', isDebit: false),
          ),
        ],
      ),
    );
  }
}
