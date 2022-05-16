import 'package:crypto_pay/constraints/contract_address.dart';
import 'package:crypto_pay/services/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';

class UserContract{
  static const List<String> abi=[
    'function createUser(string memory url,string memory name,string memory username)',
    'function checkUser()',
    'function updateName(string memory name)',
    'function updateUserName(string memory username)',
    'function updateUrl(string memory url)',
    'function getUser() public view returns (UserData memory)',
  ];

  static void checkUser(BuildContext context)async{
    try{
      final contract = Contract(ContractAddress.user, abi, provider!.getSigner(),);
      final tx=await contract.call<bool>('checkUser');
      Dialogs.popAlert(context,tx.toString());
    } catch(e) {
      Dialogs.popAlert(context,e.toString());
    }
  }

}