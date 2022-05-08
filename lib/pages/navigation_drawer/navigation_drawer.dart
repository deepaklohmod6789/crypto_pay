import 'package:crypto_pay/pages/navigation_drawer/nav_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationDrawer extends StatefulWidget {
  final PageController pageController;
  const NavigationDrawer({Key? key,required this.pageController}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {

  void changePage(int pageIndex){
    setState(() {
      widget.pageController.jumpToPage(pageIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30,),
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
        const SizedBox(height: 20,),
        NavButton(
          onPressed: ()=>changePage(0),
          icon: Icons.home,
          buttonName: 'Dashboard',
          isActive: widget.pageController.hasClients?widget.pageController.page==0:true,
        ),
        const SizedBox(height: 15,),
        NavButton(
          onPressed: ()=>changePage(1),
          icon: FontAwesomeIcons.shop,
          buttonName: 'NFT Market',
          isActive: widget.pageController.hasClients?widget.pageController.page==1:false,
        ),
        const SizedBox(height: 15,),
        NavButton(
          onPressed: ()=>changePage(2),
          icon: FontAwesomeIcons.sackDollar,
          buttonName: 'Try Lottery ',
          isActive: widget.pageController.hasClients?widget.pageController.page==2:false,
        ),
        const SizedBox(height: 15,),
        NavButton(
          onPressed: ()=>changePage(3),
          icon: Icons.security,
          buttonName: 'Authenticity',
          isActive: widget.pageController.hasClients?widget.pageController.page==3:false,
        ),
        const SizedBox(height: 15,),
        NavButton(
          onPressed: ()=>changePage(3),
          icon: Icons.person,
          buttonName: 'Your Profile',
          isActive: widget.pageController.hasClients?widget.pageController.page==3:false,
        ),
        const SizedBox(height: 15,),
        NavButton(
          onPressed: ()=>changePage(3),
          icon: Icons.settings,
          buttonName: 'Settings      ',
          isActive: widget.pageController.hasClients?widget.pageController.page==3:false,
        ),
      ],
    );
  }
}
