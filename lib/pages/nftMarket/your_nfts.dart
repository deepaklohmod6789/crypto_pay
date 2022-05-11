import 'package:crypto_pay/pages/wallet/global_tile.dart';
import 'package:flutter/material.dart';

class YourNFTs extends StatefulWidget {
  const YourNFTs({Key? key}) : super(key: key);

  @override
  State<YourNFTs> createState() => _YourNFTsState();
}

class _YourNFTsState extends State<YourNFTs> {

  Text getSuffixText({required String value}){
    return Text(
      value,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
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
            "Your NFTs",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10,),
          GlobalTile(
            image: 'nft/1.png',
            heading: 'Crazy Monkey',
            content: '18th May 2022',
            suffixText: getSuffixText(value: '1 Eth',),
          ),
          const SizedBox(height: 8,),
          GlobalTile(
            image: 'nft/2.jpg',
            heading: 'Chill Monkey',
            content: '12th June 2022',
            suffixText: getSuffixText(value: '0.5 Eth',),
          ),
          const SizedBox(height: 8,),
          GlobalTile(
            image: 'nft/3.jpg',
            heading: 'Confused Monkey',
            content: '11/5/22',
            suffixText: getSuffixText(value: '2 Eth',),
          ),
        ],
      ),
    );
  }
}
