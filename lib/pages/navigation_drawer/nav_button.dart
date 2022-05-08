import 'package:crypto_pay/constraints/themes.dart';
import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final String buttonName;
  final IconData icon;
  final bool isActive;
  final void Function() onPressed;

  const NavButton({
    Key? key,
    required this.icon,
    required this.buttonName,
    required this.isActive,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 25,
            decoration: BoxDecoration(
              color: isActive?Themes.primaryColor:Colors.transparent,
              borderRadius: const BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
            ),
          ),
        ),
        const Expanded(
          flex: 2,
          child: SizedBox(),
        ),
        Expanded(
          flex: 20,
          child: TextButton.icon(
            onPressed: onPressed,
            icon: Icon(icon),
            label: Text(buttonName),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 17),
              backgroundColor: isActive?Themes.primaryColor:Colors.transparent,
              primary: isActive?Colors.white:const Color(0xffb6cfff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        const Expanded(
          flex: 4,
          child: SizedBox(),
        ),
      ],
    );
  }
}
