import 'package:crypto_pay/models/lottery_model.dart';
import 'package:crypto_pay/services/contracts/lottery_contract.dart';
import 'package:get/get.dart';

class LotteryController extends GetxController {
  bool loading=true;
  int entryFee=0;
  bool joined=false;
  List<LotteryModel> models=[];

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData()async{
    BigInt fee=await LotteryContract.getEntryFee();
    entryFee=fee.toInt();
    joined=await LotteryContract.checkLotteryJoined();
    final participants=await LotteryContract.getParticipants();
    if(participants.isNotEmpty){
      List names=participants[0];
      List timeStamps=participants[1];
      if(names.isNotEmpty){
        for(int i=0;i<names.length;i++){
          models.add(LotteryModel(name: names[i], timeStamp: DateTime.fromMillisecondsSinceEpoch(int.parse(timeStamps[i]))));
        }
      }
    }
    loading=false;
    update();
  }

  void joinLottery(String name)async{
    LotteryContract.enterLottery(name, entryFee).then((value){
      if(value=="Success"){
        joined=true;
        models.add(LotteryModel(name: name, timeStamp: DateTime.now()));
        update();
      }
    });
  }

}