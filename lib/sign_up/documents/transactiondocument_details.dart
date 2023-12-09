import 'package:assignment/sign_up/documents/commonwidgte.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'jsontodart.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class TransactionDocumentDetails extends StatelessWidget {
  final address;
  final id;
  final List<Document> documents;
  const TransactionDocumentDetails(
      {super.key, this.address, this.id, required this.documents});

  Future<void> _launchUrl(_url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        customAppBar(context, "Transaction Document"),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Transaction Address"),
              Text(address),
              const SizedBox(height: 15.0),
              const Divider(height: 1, thickness: 0.1, color: Colors.grey),
              const SizedBox(height: 15.0),
              const Text("Transaction ID"),
              Text(id),
              const SizedBox(height: 15.0),
              const Divider(height: 1, thickness: 0.1, color: Colors.grey),
              const SizedBox(height: 15.0),
              const Text("Document Name"),
              ...documents
                  .map((document) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(document.title.toString()),
                          GestureDetector(
                            child: Image.asset("assets/eye.png"),
                            onTap: () async {
                              final Uri url = Uri.parse(document.url);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PDFViewerScreen(pdfUrl: url.toString()),
                                ),
                              );
                            },
                          ),
                        ],
                      ))
                  .toList()
            ],
          ),
        )
      ]
      ),
    );
  }
}

class PDFViewerScreen extends StatelessWidget {
  final String pdfUrl;

  const PDFViewerScreen({Key? key, required this.pdfUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PDF Viewer')),
      body: PDFView(filePath: pdfUrl),
    );
  }
}
