import 'package:crypto_pay/constraints/contract_address.dart';
import 'package:crypto_pay/services/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';

class NFTMarketContract{
  static const List<String> abi=[
    'function getListingPrice() public view returns (uint128)',
    'function createMarketItem(address nftContract, uint256 tokenId,uint256 price) public nonReentrant',
    'function buyNFT(address nftContract, uint256 itemId) public payable nonReentrant',
    'function getAllNFTsOnSale() public view returns (MarketItem[] memory)',
    'function getAllMyNFTs() public view returns (MarketItem[] memory)',
  ];

  static void getListingPrice(BuildContext context)async{
    try{
      final contract = Contract(ContractAddress.nftMarket, abi, provider!,);
      final tx=await contract.call('getAllNFTsOnSale');
      Dialogs.popAlert(context,tx.toString());
    } catch(e) {
      Dialogs.popAlert(context,e.toString());
    }
  }
}