import 'package:crypto_pay/constraints/themes.dart';
import 'package:crypto_pay/pages/dashboard/dashboard_page.dart';
import 'package:crypto_pay/pages/navigation_drawer/navigation_drawer.dart';
import 'package:crypto_pay/pages/wallet/wallet_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController=PageController(viewportFraction: 1,);

  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.bgColor,
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: NavigationDrawer(pageController: pageController,),
          ),
          Expanded(
            flex: 6,
            child: Container(
              margin: const EdgeInsets.fromLTRB(15,15,0,15),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white,Color(0xfff2f7fa),],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              child: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const DashBoardPage(),
                  Container(color: Colors.green,),
                  Container(color: Colors.yellow,),
                  Container(color: Colors.red,),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.fromLTRB(0,15,15,15),
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: const WalletPage(),
            ),
          ),
        ],
      ),
    );
  }
}
