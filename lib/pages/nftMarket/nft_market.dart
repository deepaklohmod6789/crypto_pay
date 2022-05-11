import 'package:crypto_pay/constraints/themes.dart';
import 'package:crypto_pay/pages/dashboard/nft_card.dart';
import 'package:crypto_pay/pages/nftMarket/nft_tile.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class NFTMarket extends StatefulWidget {
  const NFTMarket({Key? key}) : super(key: key);

  @override
  State<NFTMarket> createState() => _NFTMarketState();
}

class _NFTMarketState extends State<NFTMarket> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(25,25,25,10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal:20,vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                image: AssetImage('assets/nftMarketBanner.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "CryptoPay",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Themes.primaryColor,
                  ),
                ),
                const SizedBox(height: 5,),
                const Text(
                  "Create your own NFT",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "One of the largest digital marketplace for your Crypto NFTs",
                  style: TextStyle(fontSize: 12),
                ),
                const Spacer(),
                TextButton(
                  onPressed: (){},
                  style: TextButton.styleFrom(
                    side: const BorderSide(color: Colors.white)
                  ),
                  child: const Text(
                    "Create Yours",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          const SizedBox(height: 15,),
          const Text(
            "Newly Added NFTs",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 7,),
          SizedBox(
            height: 230,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                NFTCard(
                  nftImage: '3.jpg',
                  nftName: "A Crazy Ape",
                  ownerImage: 'https://yt3.ggpht.com/yti/APfAmoGKp165XoeJo6x5PC1KcNrUbd4yruZkrHC8fcgF=s108-c-k-c0x00ffffff-no-rj',
                  username: "@deepaklohmod6789",
                  price: '1.25 Eth',
                ),
                SizedBox(width: 10,),
                NFTCard(
                  nftImage: '3.jpg',
                  nftName: "A Crazy Ape",
                  ownerImage: 'https://yt3.ggpht.com/yti/APfAmoGKp165XoeJo6x5PC1KcNrUbd4yruZkrHC8fcgF=s108-c-k-c0x00ffffff-no-rj',
                  username: "@deepaklohmod6789",
                  price: '1.25 Eth',
                ),
                SizedBox(width: 10,),
                NFTCard(
                  nftImage: '3.jpg',
                  nftName: "A Crazy Ape",
                  ownerImage: 'https://yt3.ggpht.com/yti/APfAmoGKp165XoeJo6x5PC1KcNrUbd4yruZkrHC8fcgF=s108-c-k-c0x00ffffff-no-rj',
                  username: "@deepaklohmod6789",
                  price: '1.25 Eth',
                ),
              ],
            ),
          ),
          const SizedBox(height: 15,),
          const Text(
            "NFTs on Sale",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 7,),
          StickyHeader(
            header: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white,Color(0xfff2f7fa),],
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Expanded(
                        flex: 4,
                        child: Text(
                          "NFT Details",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Token Id",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Price",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Owner",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16,),
                  const Divider(height: 0,),
                ],
              ),
            ),
            content: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 23,
              separatorBuilder: (context,index)=>const Divider(),
              itemBuilder: (context,index)=>const NFTTile(),
            ),
          ),
        ],
      ),
    );
  }
}
