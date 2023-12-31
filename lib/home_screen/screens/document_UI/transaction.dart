import 'dart:convert';

import 'package:assignment/home_screen/models/document_model.dart';
import 'package:assignment/home_screen/screens/document_UI/transactiondocument_details.dart';
import 'package:flutter/material.dart';
import '../widgets/commonwidget.dart';

class TransactionDocument extends StatefulWidget {
  const TransactionDocument({super.key});

  @override
  State<TransactionDocument> createState() => _TransactionDocumentState();
}

class _TransactionDocumentState extends State<TransactionDocument> {
  late List<Transaction> transactions = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    String jsonData = await DefaultAssetBundle.of(context)
        .loadString('assets/documentjson.json');
    Welcome welcome = Welcome.fromJson(json.decode(jsonData));
    transactions = welcome.value.first.transaction;

    // Update my   UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customAppBar(context, "Transaction Document"),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  if (transactions.isNotEmpty)
                    ...transactions
                        .map((transaction) => customTransactionDocument(
                            context,
                            transaction.address,
                            "Transaction Id #${transaction.transactionId}",
                            transaction.dateType,
                            transaction.date,
                            transaction.documents))
                        .toList(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget customTransactionDocument(
    context, address, transactionID, line4, date, List<Document> documents) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          address,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(transactionID),
        const SizedBox(height: 10),
        ListTile(
          title: Text(line4),
          minVerticalPadding: 0,
          contentPadding: EdgeInsets.zero,
          subtitle: Text(date),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TransactionDocumentDetails(
                        address: address,
                        id: transactionID,
                        documents: documents)));
          },
        )
      ],
    ),
  );
}
