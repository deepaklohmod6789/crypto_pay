import 'package:crypto_pay/services/contracts/bank_contract.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  String balance='0';
  String createdAt='0/0/0000';

  @override
  void onInit() {
    getAccountData();
    super.onInit();
  }

  void addFund(int fund){
    BankContract.addFunds(fund).then((value){
      if(value=='Success'){
        balance=(int.parse(balance)+fund).toString();
        update();
      }
    });
  }

  void withdrawFund(int amount){
    BankContract.withdrawFunds(amount).then((value){
      if(value=="Success"){
        balance=(int.parse(balance)-amount).toString();
        update();
      }
    });
  }

  void transferToAccount(int amount,String address){
    BankContract.transferToAccount(amount,address).then((value){
      if(value=="Success"){
        balance=(int.parse(balance)-amount).toString();
        update();
      }
    });
  }

  void transferToWallet(int amount,String address){
    BankContract.transferToWallet(amount,address).then((value){
      if(value=="Success"){
        balance=(int.parse(balance)-amount).toString();
        update();
      }
    });
  }

  void getAccountData()async{
    List details=await BankContract.getAccountDetails();
    if(details.isNotEmpty){
      balance=details[0].toString();
      createdAt=DateTime.fromMillisecondsSinceEpoch(int.parse(details[1])).toString();
      update();
    }
  }
}