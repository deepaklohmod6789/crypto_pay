import 'package:crypto_pay/constraints/enumerations.dart';
import 'package:crypto_pay/constraints/themes.dart';
import 'package:crypto_pay/pages/nftMarket/your_nfts.dart';
import 'package:crypto_pay/pages/wallet/my_card.dart';
import 'package:crypto_pay/pages/dashboard/recent_transaction.dart';
import 'package:crypto_pay/services/controllers/wallet_controller.dart';
import 'package:crypto_pay/services/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class WalletPage extends StatelessWidget {
  final PageController pageController;
  const WalletPage({Key? key,required this.pageController}) : super(key: key);

  Widget addTransferButton({
    required String title,
    required IconData icon,
    required Color color,
    required void Function() onPressed,
  }){
    return TextButton.icon(
      onPressed: onPressed,
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

  void depositFund(BuildContext context,WalletController walletController){
    int fund=0;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text("Enter the amount of ether you want to submit"),
          content: TextField(
            decoration: const InputDecoration(
              hintText: 'Amount in wei',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (String? value){
              fund=int.parse(value!);
            },
          ),
          actions: [
            TextButton(
              onPressed: (){
                if(fund>0){
                  Navigator.pop(context);
                  walletController.addFund(fund);
                } else {
                  Dialogs.toast('Enter value to continue..');
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: Themes.primaryColor,
                primary: Colors.white,
              ),
              child: const Text(
                "Deposit",
              ),
            ),
          ],
        );
      },
    );
  }

  void transferFund(BuildContext context,WalletController walletController){
    Choice choice=Choice.walletTransfer;
    int amount=0;
    String address='';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text("Enter the details for transfer"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Amount in wei',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (String? value){
                  amount=int.parse(value!);
                },
              ),
              const SizedBox(height: 20,),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Receiver Address',
                  border: OutlineInputBorder(),
                ),
                onChanged: (String? value){
                  address=value!;
                },
              ),
              StatefulBuilder(
                builder: (context,updateState){
                  return Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: Radio<Choice>(
                            value: Choice.walletTransfer,
                            groupValue: choice,
                            onChanged: (value) {
                              updateState(() {
                                choice = value!;
                              });
                            },
                          ),
                          title: const Text('Wallet Transfer'),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          leading: Radio<Choice>(
                            value: Choice.accountTransfer,
                            groupValue: choice,
                            onChanged: (value) {
                              updateState(() {
                                choice = value!;
                              });
                            },
                          ),
                          title: const Text('Account Transfer'),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          leading: Radio<Choice>(
                            value: Choice.withdraw,
                            groupValue: choice,
                            onChanged: (value) {
                              updateState(() {
                                choice = value!;
                              });
                            },
                          ),
                          title: const Text('Withdraw'),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: (){
                if(amount>0){
                  Navigator.pop(context);
                  if(choice==Choice.accountTransfer){
                    walletController.transferToAccount(amount,address);
                  } else if (choice==Choice.walletTransfer){
                    walletController.transferToWallet(amount,address);
                  } else {
                    walletController.withdrawFund(amount);
                  }
                } else {
                  Dialogs.toast('Enter correct details to proceed');
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: Themes.primaryColor,
                primary: Colors.white,
              ),
              child: const Text(
                "Transfer",
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final walletController = Get.put(WalletController());
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
            addTransferButton(
              onPressed: ()=>depositFund(context, walletController),
              title: 'Deposit',
              icon: Icons.arrow_downward_rounded,
              color: Themes.primaryColor,
            ),
            const SizedBox(width: 10,),
            addTransferButton(
              onPressed: ()=>transferFund(context, walletController),
              title: 'Transfer',
              icon: Icons.arrow_upward_rounded,
              color: Themes.secondaryColor,
            ),
          ],
        ),
        const SizedBox(height: 30,),
        Expanded(
          child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              RecentTransaction(),
              YourNFTs(),
              RecentTransaction(),
              RecentTransaction(),
              RecentTransaction(),
              RecentTransaction(),
            ],
          ),
        ),

      ],
    );
  }
}
