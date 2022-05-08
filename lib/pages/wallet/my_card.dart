import 'package:crypto_pay/constraints/themes.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              children: const [
                Text(
                  "Balance",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Rs 120,893",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(),
                SizedBox(),
                Text(
                  "Created at:-",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "12/1/2022",
                  style: TextStyle(
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
  }
}
