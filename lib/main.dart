import 'package:crypto_pay/login.dart';
import 'package:crypto_pay/pages/homepage.dart';
import 'package:crypto_pay/services/metamask_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CryptoPay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: GetBuilder<MetaMaskAuthController>(
        init: MetaMaskAuthController(),
        builder: (walletController){
          if(walletController.isConnected&&walletController.isInOperatingChain){
            return const HomePage();
          } else {
            return const Login();
          }
        },
      ),
    );
  }
}