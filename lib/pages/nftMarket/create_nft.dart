import 'package:crypto_pay/constraints/contract_address.dart';
import 'package:crypto_pay/constraints/themes.dart';
import 'package:crypto_pay/services/contracts/nft_contract.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:crypto_pay/services/dialogs.dart';
import 'package:crypto_pay/services/ipfs.dart';
import 'package:flutter/services.dart';
import 'dart:js' as js;

class CreateNFT extends StatefulWidget {
  const CreateNFT({Key? key}) : super(key: key);

  @override
  State<CreateNFT> createState() => _CreateNFTState();
}

class _CreateNFTState extends State<CreateNFT> {
  bool loading=false;
  late TextEditingController name;
  late TextEditingController price;
  late TextEditingController description;
  XFile? image;
  String? tokenUri;

  @override
  void initState(){
    name=TextEditingController();
    price=TextEditingController();
    description=TextEditingController();
    super.initState();
  }

  @override
  void dispose(){
    name.dispose();
    price.dispose();
    description.dispose();
    super.dispose();
  }

  void createNFT()async{
    setState((){
      loading=true;
    });
    tokenUri=await IPFS.getTokenUri(image!, name.text.trim(), description.text.trim());
    if(tokenUri!=null){
      NFTContract.createNFT(tokenUri!).then((value)async{
        if(value=="Success"){
          BigInt tokenCount=await NFTContract.getTokenCounter();
          String url="https://testnets.opensea.io/assets/${ContractAddress.nft}/${tokenCount.toInt()-1}";
          Navigator.pop(context);
          urlDialog(url);
        } else {
          Navigator.pop(context);
        }
      });
    } else {
      Navigator.pop(context);
    }
  }

  void urlDialog(String url){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text("NFT created successfully"),
          content: const Text("It will take some time to reflect changes, you can also check your NFT at OpenSea"),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
                js.context.callMethod('open', [url]);
              },
              style: TextButton.styleFrom(
                backgroundColor: Themes.primaryColor,
                primary: Colors.white,
              ),
              child: const Text(
                "Check",
              ),
            ),
            TextButton(
              onPressed: ()=>Navigator.pop(context),
              style: TextButton.styleFrom(
                backgroundColor: Themes.primaryColor,
                primary: Colors.white,
              ),
              child: const Text(
                "Cancel",
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: const Text("Upload your NFT"),
      content: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Choose File",),
                    TextButton(
                      onPressed: ()async{
                        ImagePicker _picker=ImagePicker();
                        image = await _picker.pickImage(source: ImageSource.gallery);
                        setState((){});
                      },
                      child: image==null?const Icon(Icons.add):Text(
                        image!.name,
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Themes.bgColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8,),
              TextField(
                controller: price,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  hintText: 'Price in Eth',
                  isDense: true,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8,),
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  hintText: 'NFT name',
                  isDense: true,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8,),
              TextField(
                controller: description,
                keyboardType: TextInputType.multiline,
                minLines: 3,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Description of your NFT',
                  isDense: true,
                ),
              ),
            ],
          ),
          loading?const Center(child: CircularProgressIndicator()):const SizedBox(),
        ],
      ),
      actions: [
        TextButton(
          onPressed: ()async{
            if(name.text.trim().length<5){
              Dialogs.toast('Name should be at least 5 characters long');
            } else if(price.text.isEmpty){
              Dialogs.toast("Price can't be empty");
            } else if(image==null){
              Dialogs.toast("Choose an image to continue");
            } else if(description.text.trim().isEmpty){
              Dialogs.toast("Description can't be empty");
            } else {
              createNFT();
            }
          },
          style: TextButton.styleFrom(
            backgroundColor: Themes.primaryColor,
            primary: Colors.white,
          ),
          child: const Text(
            "Upload",
          ),
        ),
      ],
    );
  }
}
