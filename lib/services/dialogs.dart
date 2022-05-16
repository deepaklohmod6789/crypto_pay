import 'package:crypto_pay/constraints/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:crypto_pay/services/ipfs.dart';

class Dialogs{
  static void toast(String content){
    Fluttertoast.showToast(
      msg: content,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.transparent,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
  static void popAlert(BuildContext context,String content){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(content),
        );
      },
    );
  }

  static void createNFT(BuildContext context){
    TextEditingController name=TextEditingController();
    TextEditingController price=TextEditingController();
    TextEditingController description=TextEditingController();
    XFile? image;
    String? tokenUri;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text("Upload your NFT"),
          content: StatefulBuilder(
            builder: (context,updateState){
              return Column(
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
                            updateState((){});
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
                    minLines: 1,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      hintText: 'Description of your NFT',
                      isDense: true,
                    ),
                  ),
                ],
              );
            },
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
                  tokenUri=await IPFS.getTokenUri(image!, name.text.trim(), description.text.trim());
                  if(tokenUri!=null){
                    Get.defaultDialog(title:tokenUri!);
                  }
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
      },
    );
  }
}