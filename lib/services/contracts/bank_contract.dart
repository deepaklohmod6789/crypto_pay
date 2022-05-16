import 'package:crypto_pay/constraints/contract_address.dart';
import 'package:crypto_pay/services/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';

class BankContract{
  static const List<String> _abi=[
    'function getAccountDetails() public view returns (uint256, string memory)',
    'function createAccount(string memory date) public',
    'function getAccountBalance() public view returns (uint256)',
    'function addFunds() public payable',
    'function withdrawFunds(uint256 amount) public',
    'function transferToAccount(uint256 amount, address receiverAddress) public',
    'function transferToWallet(uint256 amount, address receiverAddress) public',
  ];

  static void createAccount(BuildContext context)async{
    try{
      final contract = Contract(ContractAddress.bank, _abi, provider!.getSigner(),);
      final tx = await contract.send('createAccount', [DateTime.now().millisecondsSinceEpoch.toString()]);
      final receipt = await tx.wait();
      Dialogs.toast(receipt.transactionHash);
    } catch(e) {
      Dialogs.popAlert(context,e.toString());
    }
  }

  /// Fund value should be in wei
  static Future<String> addFunds(int fund)async{
    try{
      final contract = Contract(ContractAddress.bank, _abi, provider!.getSigner(),);
      final tx = await contract.send(
        'addFunds',
        [],
        TransactionOverride(value: BigInt.from(fund)),
      );
      await tx.wait();
      return 'Success';
    } catch(e) {
      Dialogs.toast(e.toString());
      return 'error';
    }
  }

  ///Amount should be in wei
  static Future<String> withdrawFunds(int amount)async{
    try{
      final contract = Contract(ContractAddress.bank, _abi, provider!.getSigner(),);
      final tx = await contract.send(
        'withdrawFunds',
        [BigInt.from(5000)],
      );
      await tx.wait();
      return 'Success';
    } catch(e) {
      Dialogs.toast(e.toString());
      return 'error';
    }
  }

  ///Amount should be in wei
  static Future<String> transferToAccount(int amount,String address)async{
    try{
      final contract = Contract(ContractAddress.bank, _abi, provider!.getSigner(),);
      final tx = await contract.send(
        'transferToAccount',
        [
          BigInt.from(amount),
          address,
        ],
      );
      await tx.wait();
      return 'Success';
    } catch(e) {
      Dialogs.toast(e.toString());
      return 'error';
    }
  }

  ///Amount should be in wei
  static Future<String> transferToWallet(int amount,String address)async{
    try{
      final contract = Contract(ContractAddress.bank, _abi, provider!.getSigner(),);
      final tx = await contract.send(
        'transferToWallet',
        [
          BigInt.from(amount),
          address,
        ],
      );
      await tx.wait();
      return 'Success';
    } catch(e) {
      Dialogs.toast(e.toString());
      return 'error';
    }
  }

  static Future<String> getAccountBalance()async{
    try{
      final contract = Contract(ContractAddress.bank, _abi, provider!.getSigner(),);
      final BigInt balance=await contract.call<BigInt>('getAccountBalance');
      return balance.toString();
    } catch(e) {
      Dialogs.toast(e.toString());
      return '0';
    }
  }

  static Future getAccountDetails()async{
    try{
      final contract = Contract(ContractAddress.bank, _abi, provider!.getSigner(),);
      final balance=await contract.call('getAccountDetails');
      return balance;
    } catch(e) {
      Dialogs.toast(e.toString());
      return [];
    }
  }

}