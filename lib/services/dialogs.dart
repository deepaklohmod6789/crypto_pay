import 'package:crypto_pay/constraints/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  static void depositFund(BuildContext context){
    int amount=0;
    String address='';
    bool accountTransfer=true;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text("Enter the details for transfer"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Amount in wei',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (String? value){
                  amount=int.parse(value!);
                },
              ),
              const SizedBox(height: 20,),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Receiver Address',
                  border: OutlineInputBorder(),
                ),
                onChanged: (String? value){
                  address=value!;
                },
              ),
              StatefulBuilder(
                builder: (context,updateState){
                  return Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: Radio<bool>(
                            value: true,
                            groupValue: accountTransfer,
                            onChanged: (value) {
                              updateState(() {
                                accountTransfer = value!;
                              });
                            },
                          ),
                          title: const Text('Account Transfer'),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          leading: Radio<bool>(
                            value: false,
                            groupValue: accountTransfer,
                            onChanged: (value) {
                              updateState(() {
                                accountTransfer = value!;
                              });
                            },
                          ),
                          title: const Text('Wallet Transfer'),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: (){
                if(amount>0){

                }
              },
              style: TextButton.styleFrom(
                backgroundColor: Themes.primaryColor,
                primary: Colors.white,
              ),
              child: const Text(
                "Transfer",
              ),
            ),
          ],
        );
      },
    );
  }
}