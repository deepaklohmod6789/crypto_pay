import 'package:crypto_pay/constraints/contract_address.dart';
import 'package:crypto_pay/services/dialogs.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:get/get.dart';

class LotteryContract{
  static const List<String> _abi=[
    'function getEntryFee() public view returns (uint256)',
    'function getLatestPrice() public view returns (int256)',
    'function enterLottery(string memory timeStamp, string memory name) public payable',
    'function getParticipants() public view returns (string[] memory, string[] memory)',
    'function checkLotteryJoined() public view returns (bool)',
    'function checkLotteryIsOpen() public view returns (bool)',
  ];

  static Future<bool> checkLotteryJoined()async{
    try{
      final contract = Contract(ContractAddress.lottery, _abi, provider!.getSigner(),);
      final joined=await contract.call<bool>('checkLotteryJoined');
      return joined;
    } catch(e) {
      Dialogs.toast(e.toString());
      return false;
    }
  }

  static Future<bool> checkLotteryIsOpen()async{
    try{
      final contract = Contract(ContractAddress.lottery, _abi, provider!.getSigner(),);
      final open=await contract.call<bool>('checkLotteryIsOpen');
      return open;
    } catch(e) {
      Dialogs.toast(e.toString());
      return false;
    }
  }

  static Future getParticipants()async{
    try{
      final contract = Contract(ContractAddress.lottery, _abi, provider!.getSigner(),);
      final participants=await contract.call('getParticipants');
      return participants;
    } catch(e) {
      Get.defaultDialog(title:e.toString());
      return [];
    }
  }

  static Future<BigInt> getEntryFee()async{
    try{
      final contract = Contract(ContractAddress.lottery, _abi, provider!.getSigner(),);
      final balance=await contract.call<BigInt>('getEntryFee');
      return balance;
    } catch(e) {
      Dialogs.toast(e.toString());
      return BigInt.from(0);
    }
  }

  static Future<String> enterLottery(String name,int entryFee)async{
    try{
      final contract = Contract(ContractAddress.lottery, _abi, provider!.getSigner(),);
      final tx = await contract.send(
        'enterLottery',
        [
          DateTime.now().millisecondsSinceEpoch.toString(),
          name,
        ],
        TransactionOverride(value: BigInt.from(entryFee)),
      );
      await tx.wait();
      return 'Success';
    } catch(e) {
      Dialogs.toast(e.toString());
      return 'error';
    }
  }

}