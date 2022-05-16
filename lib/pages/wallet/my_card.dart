import 'package:crypto_pay/constraints/themes.dart';
import 'package:crypto_pay/services/controllers/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walletController = Get.put(WalletController());
    return GetBuilder(
      init: WalletController(),
      builder: (context){
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 25),
                height: 130.0,
                decoration: BoxDecoration(
                  color: Themes.secondaryColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Color(0xffd2eafe),
                      blurRadius: 15.0,
                      offset: Offset(0.0, 10),
                      blurStyle: BlurStyle.inner,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 130.0,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Themes.secondaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Balance",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      walletController.balance,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(),
                    const SizedBox(),
                    const Text(
                      "Created at:-",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      walletController.createdAt,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
