import 'package:flutter/material.dart';

class LotteryTile extends StatelessWidget {
  const LotteryTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: Row(
            children: const [
              Text(
                "1",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black38,
                ),
              ),
              SizedBox(width: 7,),
              CircleAvatar(
                backgroundImage: NetworkImage('https://yt3.ggpht.com/yti/APfAmoGKp165XoeJo6x5PC1KcNrUbd4yruZkrHC8fcgF=s108-c-k-c0x00ffffff-no-rj'),
                radius: 15,
              ),
              SizedBox(width: 7,),
              Text(
                "Deepak Lohmod",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
        const Expanded(
          flex: 2,
          child: Text(
            "11th Jan 2022",
            style: TextStyle(
              fontSize: 12,
              color: Colors.black38,
            ),
          ),
        ),
      ],
    );
  }
}
