import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto_pay/services/dialogs.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class IPFS{
  final String _ipfsURL='http://127.0.0.1:5001';
  final String _endpoint='/api/v0/add';

  Future<String> getTokenUri()async{
    Map<String,String> metaData={};
    ImagePicker _picker=ImagePicker();
    final XFile? imageFile = await _picker.pickImage(source: ImageSource.gallery);
    if(imageFile!=null){
      Uint8List imageBytes = await imageFile.readAsBytes();
      List<int> listData = imageBytes.cast();
      String imageUri=await _uploadToIpfs(listData,imageFile.name);
      metaData['name']='Eagle';
      metaData['description']='A beautiful eagle';
      metaData['image']=imageUri;
      String fileUri=await _uploadToIpfs(jsonEncode(metaData).codeUnits,'metaData.json');
      return fileUri;
    }
    return '';
  }

  Future<String> _uploadToIpfs(List<int> listData,String fileName)async{
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