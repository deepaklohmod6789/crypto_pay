import 'package:crypto_pay/constraints/themes.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.bgColor,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width*0.8,
          height: MediaQuery.of(context).size.height*0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [Colors.white,Color(0xfff2f7fa),],
            ),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Colors.black26,
                blurRadius: 7.0,
                offset: Offset(0.0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/logo.png',height: 40,),
                      const SizedBox(width: 7,),
                      const Text(
                        "CryptoPay",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'A Single Place for all\nyour Crypto Needs',
                    style: TextStyle(
                      fontSize: 40,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      TextButton(
                        onPressed: (){},
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                          side: const BorderSide(color: Themes.primaryColor),
                          backgroundColor: Colors.transparent,
                          primary: Themes.primaryColor,
                        ),
                        child: const Text(
                          'Get chrome extension',
                        ),
                      ),
                      const SizedBox(width: 20,),
                      TextButton(
                        onPressed: (){},
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                          backgroundColor: Themes.primaryColor,
                          primary: Colors.white,
                        ),
                        child: const Text(
                          'Connect Wallet',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Image.asset('assets/login.png',height: 350,),
            ],
          ),
        ),
      ),
    );
  }
}
