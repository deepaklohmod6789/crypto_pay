import 'package:flutter/material.dart';

class NFTTile extends StatelessWidget {
  const NFTTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Row(
            children: [
              const Text(
                "1",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black38,
                ),
              ),
              const SizedBox(width: 7,),
              const CircleAvatar(
                backgroundImage: AssetImage('assets/nft/1.png'),
                radius: 15,
              ),
              const SizedBox(width: 7,),
              Column(
                children: const [
                  Text(
                    "Crazy Apes",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  Text(
                    "11th Jan 2022",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Expanded(
          flex: 1,
          child: Text(
            "2",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black38,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: IntrinsicHeight(
            child: Row(
              children: [
                Image.asset('assets/etherLogo.png',height: 18,),
                const Text(
                  "1.4",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Expanded(
          flex: 2,
          child: Text(
            "deepaklohmod6789",
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
