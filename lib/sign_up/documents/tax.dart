import 'package:flutter/material.dart';
import 'commonwidget.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class TaxDocument extends StatefulWidget {
  const TaxDocument({Key? key}) : super(key: key);

  @override
  State<TaxDocument> createState() => _TaxDocumentState();
}

class _TaxDocumentState extends State<TaxDocument> {
  List<Map<String, dynamic>> taxDocuments = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  void loadJsonData() async {
    try {
      String jsonString = await rootBundle.loadString('assets/documentjson.json');
      Map<String, dynamic> jsonData = jsonDecode(jsonString);

      List<dynamic> taxList = jsonData['value'][0]['tax'];

      setState(() {
        taxDocuments = List<Map<String, dynamic>>.from(taxList);
      });
    } catch (e) {
      print('Error loading JSON file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customAppBar(context, "Tax Document"),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                for (var item in taxDocuments)
                  customListTile(
                    item["title"] ?? "",
                    item["size"] ?? "",
                    item["url"] ?? "",
                    context,
                  ),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
