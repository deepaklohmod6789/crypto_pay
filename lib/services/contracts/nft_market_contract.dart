import 'package:crypto_pay/constraints/contract_address.dart';
import 'package:crypto_pay/services/dialogs.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:get/get.dart';

class NFTMarketContract{
  static const List<String> _abi=[
    'function getListingPrice() public view returns (uint128)',
    'function createMarketItem(address nftContract, uint256 tokenId,uint256 price) public nonReentrant',
    'function buyNFT(address nftContract, uint256 itemId) public payable nonReentrant',
    'function getAllNFTsOnSale() public view returns (MarketItem[] memory)',
    'function getAllMyNFTs() public view returns (MarketItem[] memory)',
  ];

  static Future<BigInt> getListingPrice()async{
    try{
      final contract = Contract(ContractAddress.nftMarket, _abi, provider!.getSigner(),);
      final listingPrice=await contract.call<BigInt>('getListingPrice');
      return listingPrice;
    } catch(e) {
      Dialogs.toast(e.toString());
      return BigInt.from(0);
    }
  }

  static void getAllNFTsOnSale()async{
    try{
      final contract = Contract(ContractAddress.nftMarket, _abi, provider!.getSigner(),);
      final nfts=await contract.call('getAllNFTsOnSale');
      Get.defaultDialog(title: nfts.toString());
    } catch(e) {
      Get.defaultDialog(title:e.toString());
    }
  }

  static Future<String> createNFT(String name,int entryFee)async{
    try{
      final contract = Contract(ContractAddress.nftMarket, _abi, provider!.getSigner(),);
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