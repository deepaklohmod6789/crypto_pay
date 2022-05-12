import 'package:crypto_pay/constraints/themes.dart';
import 'package:crypto_pay/pages/nftMarket/your_nfts.dart';
import 'package:crypto_pay/pages/wallet/my_card.dart';
import 'package:crypto_pay/pages/dashboard/recent_transaction.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  final PageController pageController;
  const WalletPage({Key? key,required this.pageController}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {

  Widget reqSendButton({required String title, required IconData icon, required Color color}){
    return TextButton.icon(
      onPressed: (){},
      icon: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon,color: color,size: 20,),
      ),
      label: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
      style: TextButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: (){},
              iconSize: 20,
              icon: const Icon(Icons.notifications_active,color: Color(0xffa3abca),),
            ),
            const Spacer(),
            const CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage('https://yt3.ggpht.com/yti/APfAmoGKp165XoeJo6x5PC1KcNrUbd4yruZkrHC8fcgF=s108-c-k-c0x00ffffff-no-rj'),
            ),
            TextButton.icon(
              onPressed: (){},
              icon: const Text(
                "Deepak Lohmod",
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              label: const Icon(Icons.arrow_drop_down),
              style: TextButton.styleFrom(
                primary: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10,),
        const Text(
          "My Wallet",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15,),
        const MyCard(),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            reqSendButton(
              title: 'Request',
              icon: Icons.arrow_downward_rounded,
              color: Themes.primaryColor,
            ),
            const SizedBox(width: 10,),
            reqSendButton(
              title: 'Transfer',
              icon: Icons.arrow_upward_rounded,
              color: Themes.secondaryColor,
            ),
          ],
        ),
        const SizedBox(height: 30,),
        Expanded(
          child: PageView(
            controller: widget.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const RecentTransaction(),
              const YourNFTs(),
              const RecentTransaction(),
              Container(color: Colors.red,),
              Container(color: Colors.green,),
            ],
          ),
        ),

      ],
    );
  }
}
