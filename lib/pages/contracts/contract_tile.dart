import 'package:flutter/material.dart';
import 'dart:js' as js;

class ContractTile extends StatelessWidget {
  final String image;
  final String contractName;
  final String address;

  const ContractTile({
    Key? key,
    required this.image,
    required this.contractName,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: ()=>js.context.callMethod('open', ['https://rinkeby.etherscan.io/address/$address']),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(8),
            minimumSize: const Size(double.infinity, 60),
          ),
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 12,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Image.asset('assets/contracts/$image.png',height: 30,),
                      const SizedBox(width: 7,),
                      Expanded(
                        child: Text(
                          contractName,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    address,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38)
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.brightness_1,color: Colors.green,size: 14,),
                      Text(
                        'Active',
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10,),
                const Expanded(
                  flex: 2,
                  child: Text('13 minutes ago'),
                ),
              ],
            ),
          ),
        ),
        const Divider(height: 0,),
      ],
    );
  }
}
