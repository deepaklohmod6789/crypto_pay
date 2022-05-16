import 'package:crypto_pay/services/contracts/nft_market_contract.dart';
import 'package:get/get.dart';

class NFTMarketController extends GetxController {

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData()async{
    BigInt price=await NFTMarketContract.getListingPrice();
    update();
  }
}