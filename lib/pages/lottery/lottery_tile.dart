import 'package:crypto_pay/models/lottery_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LotteryTile extends StatelessWidget {
  final int index;
  final LotteryModel model;
  const LotteryTile({Key? key,required this.index,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: Row(
            children: [
              Text(
                index.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black38,
                ),
              ),
              const SizedBox(width: 7,),
              const CircleAvatar(
                backgroundImage: NetworkImage('https://yt3.ggpht.com/yti/APfAmoGKp165XoeJo6x5PC1KcNrUbd4yruZkrHC8fcgF=s108-c-k-c0x00ffffff-no-rj'),
                radius: 15,
              ),
              const SizedBox(width: 7,),
              Text(
                model.name,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            DateFormat.yMMMd().format(model.timeStamp).toString(),
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black38,
            ),
          ),
        ),
      ],
    );
  }
}
