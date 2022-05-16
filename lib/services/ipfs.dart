import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto_pay/services/dialogs.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class IPFS{
  static const String _ipfsURL='http://127.0.0.1:5001';
  static const _endpoint='/api/v0/add';

  static Future<String?> getTokenUri(XFile imageFile,String name,String description)async{
    try{
      Map<String,String> metaData={};
      Uint8List imageBytes = await imageFile.readAsBytes();
      List<int> listData = imageBytes.cast();
      String imageUri=await _uploadToIpfs(listData,imageFile.name);
      metaData['name']=name;
      metaData['description']=description;
      metaData['image']=imageUri;
      String fileUri=await _uploadToIpfs(jsonEncode(metaData).codeUnits,'metaData.json');
      return fileUri;
    } catch (e){
      Dialogs.toast(e.toString());
      return null;
    }
  }

  static Future<String> _uploadToIpfs(List<int> listData,String fileName)async{
    Uri uri = Uri.parse(_ipfsURL+_endpoint);
    http.MultipartRequest request = http.MultipartRequest('POST', uri);
    http.MultipartFile multipartFile = http.MultipartFile.fromBytes('files', listData);
    request.files.add(multipartFile);
    String hash='';
    try{
      http.StreamedResponse streamedResponse = await request.send();
      http.Response response = await http.Response.fromStream(streamedResponse);
      final result = jsonDecode(response.body) as Map<String, dynamic>;
      hash=result['Hash'];
    } catch(e) {
      Dialogs.toast('Check whether ipfs daemon is running:- ${e.toString()}');
    }
    String imageUri='ipfs://$hash?filename=$fileName';
    return imageUri;
  }

}