import 'package:crypto_pay/constraints/themes.dart';
import 'package:crypto_pay/pages/dashboard/nft_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(25,25,25,10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Deepak Lohmod",
            style: TextStyle(
              color: Color(0xffc1c1c3),
            ),
          ),
          const Text(
            "Dashboard",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            height: 200,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Themes.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "One Place for All Your\nCrypto Needs",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Text(
                        "View your detailed transaction here",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white70,
                        ),
                      ),
                      TextButton(
                        onPressed: (){},
                        child: const Text(
                          "Check on GitHub",
                          style: TextStyle(fontSize: 10),
                        ),
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          primary: Colors.white,
                          backgroundColor: Themes.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  'assets/poster.svg',
                  height: 180,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Row(
            children: const [
              Spacer(),
              Text(
                "1200",
                style: TextStyle(
                  fontSize: 30,
                  color: Themes.primaryColor,
                ),
              ),
              Text(
                "Active\nAccounts",
                style: TextStyle(
                  height: 1,
                  fontSize: 11,
                ),
              ),
              Spacer(),
              Text(
                "900",
                style: TextStyle(
                  fontSize: 30,
                  color: Themes.primaryColor,
                ),
              ),
              Text(
                "Transactions\nProcessed",
                style: TextStyle(
                  height: 1,
                  fontSize: 11,
                ),
              ),
              Spacer(),
              Text(
                "109",
                style: TextStyle(
                  fontSize: 30,
                  color: Themes.primaryColor,
                ),
              ),
              Text(
                "NFTs\nOn Sale",
                style: TextStyle(
                  height: 1,
                  fontSize: 11,
                ),
              ),
              Spacer(),
            ],
          ),
          const SizedBox(height: 10,),
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
                  nftImage: '1.png',
                  nftName: "A Chill Ape",
                  ownerImage: 'https://yt3.ggpht.com/yti/APfAmoGKp165XoeJo6x5PC1KcNrUbd4yruZkrHC8fcgF=s108-c-k-c0x00ffffff-no-rj',
                  username: "@deepaklohmod6789",
                  price: '0.25 Eth',
                ),
                SizedBox(width: 10,),
                NFTCard(
                  nftImage: '2.jpg',
                  nftName: "A tired Ape",
                  ownerImage: 'https://yt3.ggpht.com/yti/APfAmoGKp165XoeJo6x5PC1KcNrUbd4yruZkrHC8fcgF=s108-c-k-c0x00ffffff-no-rj',
                  username: "@deepaklohmod6789",
                  price: '10. Eth',
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
        ],
      ),
    );
  }
}
