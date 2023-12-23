
import 'package:flutter/material.dart';
import '../widgets/commonwidget.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class TeamDocument extends StatefulWidget {
  const TeamDocument({Key? key}) : super(key: key);

  @override
  State<TeamDocument> createState() => _TeamDocumentState();
}

class _TeamDocumentState extends State<TeamDocument> {
  List<Map<String, dynamic>> teamDocuments = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  void loadJsonData() async {
    try {
      String jsonString = await rootBundle.loadString('assets/documentjson.json');
      Map<String, dynamic> jsonData = jsonDecode(jsonString);

      List<dynamic> teamList = jsonData['value'][0]['team'];

      setState(() {
        teamDocuments = List<Map<String, dynamic>>.from(teamList);
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
          customAppBar(context, "Team Document"),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                for (var item in teamDocuments)
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
          )
        ],
      ),
    );
  }
}

