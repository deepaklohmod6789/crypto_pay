import 'package:flutter/material.dart';

class GlobalTile extends StatelessWidget {
  final String image;
  final String heading;
  final String content;
  final Text suffixText;

  const GlobalTile({
    Key? key,
    required this.image,
    required this.heading,
    required this.content,
    required this.suffixText,
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
          CircleAvatar(
            radius: 17.5,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/$image'),
          ),
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
                content,
                style: const TextStyle(
                  fontSize: 9,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
          const Spacer(),
          suffixText,
        ],
      ),
    );
  }
}
