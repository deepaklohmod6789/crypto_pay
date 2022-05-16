import 'package:crypto_pay/constraints/contract_address.dart';
import 'package:crypto_pay/services/dialogs.dart';
import 'package:flutter_web3/flutter_web3.dart';

class NFTContract{
  static const List<String> _abi=[
    'function createCollectible(address marketAddress, string memory tokenURI)',
    'function getTokenCounter() public view returns (uint256)',
  ];

  static Future<BigInt> getTokenCounter()async{
    try{
      final contract = Contract(ContractAddress.nft, _abi, provider!.getSigner(),);
      final tokenCount=await contract.call<BigInt>('getTokenCounter');
      return tokenCount;
    } catch(e) {
      Dialogs.toast(e.toString());
      return BigInt.from(0);
    }
  }

  static Future<String> createNFT(String tokenUri)async{
    try{
      final contract = Contract(ContractAddress.nft, _abi, provider!.getSigner(),);
      final tx = await contract.send(
        'createCollectible',
        [
          ContractAddress.nftMarket,
          tokenUri,
        ],
      );
      await tx.wait();
      return 'Success';
    } catch(e) {
      Dialogs.toast(e.toString());
      return 'error';
    }
  }

}