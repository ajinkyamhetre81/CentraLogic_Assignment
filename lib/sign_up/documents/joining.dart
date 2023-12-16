import 'package:flutter/material.dart';
import 'commonwidget.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class JoiningDocument extends StatefulWidget {
  const JoiningDocument({Key? key}) : super(key: key);

  @override
  State<JoiningDocument> createState() => _JoiningDocumentState();
}

class _JoiningDocumentState extends State<JoiningDocument> {
  List<Map<String, dynamic>> joiningDocuments = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  void loadJsonData() async {
    try {
      String jsonString = await rootBundle.loadString('assets/documentjson.json');
      Map<String, dynamic> jsonData = jsonDecode(jsonString);

      List<dynamic> joiningList = jsonData['value'][0]['joining'];

      setState(() {
        joiningDocuments = List<Map<String, dynamic>>.from(joiningList);
      });
    } catch (e) {
      print('Error loading JSON file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            customAppBar(context, "Joining Document"),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  for (var item in joiningDocuments)
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
      ),
    );
  }
}
