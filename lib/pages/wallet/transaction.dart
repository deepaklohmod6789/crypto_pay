import 'package:crypto_pay/constraints/themes.dart';
import 'package:flutter/material.dart';

class Transaction extends StatelessWidget {
  final String image;
  final String heading;
  final String timeStamp;
  final String value;
  final bool isDebit;

  const Transaction({
    Key? key,
    required this.image,
    required this.heading,
    required this.timeStamp,
    required this.value,
    required this.isDebit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.0,
            offset: Offset(0.0, 1),
            blurStyle: BlurStyle.inner,
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset('assets/$image',height: 35,),
          const SizedBox(width: 7,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 3,),
              Text(
                timeStamp,
                style: const TextStyle(
                  fontSize: 9,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: isDebit?Themes.secondaryColor:Themes.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
