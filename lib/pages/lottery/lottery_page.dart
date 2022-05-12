import 'package:crypto_pay/pages/lottery/lottery_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:sticky_headers/sticky_headers.dart';

class LotteryPage extends StatefulWidget {
  const LotteryPage({Key? key}) : super(key: key);

  @override
  State<LotteryPage> createState() => _LotteryPageState();
}

class _LotteryPageState extends State<LotteryPage> {

  DateTime upcomingSunday(DateTime date){
    return DateTime(date.year, date.month, date.day + (date.weekday % 7)-1);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(25,25,25,10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal:20,vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage('assets/lotteryBanner.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Bonus Lottery",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text.rich(
                      TextSpan(
                        text: 'Every Week on ',
                        children: [
                          TextSpan(
                            text: 'Sun. 00:00am ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "one player will be randomly\nselected who'll win the total prize pool.",
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Image.asset('assets/etherLogo.png',height: 20,),
                        const Text(
                          "120",
                          style: TextStyle(
                            fontSize: 28,
                          ),
                        ),
                        const SizedBox(width: 30,),
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.yellow),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Expires in:",
                                style: TextStyle(
                                  fontSize: 16,
                                  height: 1.2,
                                ),
                              ),
                              CountdownTimer(
                                endTime: upcomingSunday(DateTime.now()).millisecondsSinceEpoch,
                                widgetBuilder: (_, CurrentRemainingTime? time) {
                                  if (time == null) {
                                    return const Text('Game over');
                                  }
                                  return Text(
                                    '${time.days} DAYS ${time.hours}H ${time.min}MIN',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      height: 1.2,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: TextButton(
                  onPressed: (){},
                  child: Image.asset('assets/joinButton.png',height: 40,),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7,),
          StickyHeader(
            header: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white,Color(0xfff2f7fa),],
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Expanded(
                        flex: 6,
                        child: Text(
                          "Participants",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "TimeStamp",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16,),
                  const Divider(height: 0,),
                ],
              ),
            ),
            content: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 23,
              separatorBuilder: (context,index)=>const Divider(),
              itemBuilder: (context,index)=>const LotteryTile(),
            ),
          ),
        ],
      ),
    );
  }
}
