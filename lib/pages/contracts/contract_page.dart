import 'package:crypto_pay/pages/contracts/contract_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class ContractPage extends StatelessWidget {
  static const List<String> contracts=[
    'Bank',
    'NFT Market',
    'Lottery',
    'Product Check'
  ];
  const ContractPage({Key? key}) : super(key: key);

  Future<List<String>> getSuggestion(String pattern)async{
    return contracts.where((element) => element.toUpperCase().contains(pattern.toUpperCase())).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(25,25,25,10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Contracts",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          Text(
            "${contracts.length} contracts",
            style: const TextStyle(
              fontSize: 12,
              height: 1.2
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            color: const Color(0xfffafcff),
            padding: const EdgeInsets.all(10),
            child: TypeAheadField(
              textFieldConfiguration: const TextFieldConfiguration(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  isDense: true,
                  hintText: 'Search for contract',
                  border: OutlineInputBorder(),
                ),
              ),
              suggestionsCallback: (String pattern) async {
                return getSuggestion(pattern);
              },
              itemBuilder: (context, String suggestion) {
                return ContractTile(
                  image: suggestion,
                  contractName: suggestion,
                  address: '0xC31A29A757CeD0c852e3aEF31be4493f8Dc86c3a',
                );
              },
              onSuggestionSelected: (suggestion) {

              },
            ),
          ),
          const SizedBox(height: 10,),
          ListView.builder(
            shrinkWrap: true,
            itemCount: contracts.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
              return ContractTile(
                image: contracts[index],
                contractName: contracts[index],
                address: '0xC31A29A757CeD0c852e3aEF31be4493f8Dc86c3a',
              );
            },
          ),
        ],
      ),
    );
  }
}
