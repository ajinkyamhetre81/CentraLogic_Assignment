// import 'package:assignment/sign_up/documents/commonwidget.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'jsontodart.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// class TransactionDocumentDetails extends StatelessWidget {
//   final address;
//   final id;
//   final List<Document> documents;
//   const TransactionDocumentDetails(
//       {super.key, this.address, this.id, required this.documents});

//   Future<void> _launchUrl(_url) async {
//     if (!await launchUrl(_url)) {
//       throw Exception('Could not launch $_url');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(children: [
//         customAppBar(context, "Transaction Document"),
//         Padding(
//           padding: const EdgeInsets.all(25.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text("Transaction Address"),
//               Text(address),
//               const SizedBox(height: 15.0),
//               const Divider(height: 1, thickness: 0.1, color: Colors.grey),
//               const SizedBox(height: 15.0),
//               const Text("Transaction ID"),
//               Text(id),
//               const SizedBox(height: 15.0),
//               const Divider(height: 1, thickness: 0.1, color: Colors.grey),
//               const SizedBox(height: 15.0),
//               const Text("Document Name"),
//               ...documents
//                   .map((document) => Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(document.title.toString()),
//                           GestureDetector(
//                             child: Image.asset("assets/eye.png"),
//                             onTap: () async {
//                               final Uri url = Uri.parse(document.url);
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) =>
//                                       PDFViewerScreen(pdfUrl: url.toString()),
//                                 ),
//                               );
//                             },
//                           ),
//                         ],
//                       ))
//                   .toList()
//             ],
//           ),
//         )
//       ]
//       ),
//     );
//   }
// }


// class PDFViewerScreen extends StatelessWidget {
//   final String pdfUrl;

//   const PDFViewerScreen({Key? key, required this.pdfUrl}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title:  Text(pdfUrl)),
//       body: SfPdfViewer.network(
//         pdfUrl,
//         controller: PdfViewerController(),
//       ),
//     );
//   }
// }
import 'package:assignment/home_screen/models/document_model.dart';
import 'package:flutter/material.dart';
import '../widgets/commonwidget.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class TransactionDocumentDetails extends StatefulWidget {
  final String address;
  final String id;
  final List<Document> documents;

  const TransactionDocumentDetails({
    Key? key,
    required this.address,
    required this.id,
    required this.documents,
  }) : super(key: key);

  @override
  _TransactionDocumentDetailsState createState() =>
      _TransactionDocumentDetailsState();
}

class _TransactionDocumentDetailsState
    extends State<TransactionDocumentDetails> {
  late List<Document> _loadedDocuments;
  late List<String> _transactionTitles;

  @override
  void initState() {
    super.initState();
    _transactionTitles = [];
    _loadDocuments();
  }

  Future<void> _loadDocuments() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/documentjson.json');
      Map<String, dynamic> jsonData = jsonDecode(jsonString);
      List<dynamic> documentList =
          jsonData['value'][0]['transaction'][0]['documents'];
      setState(() {
        _loadedDocuments =
            documentList.map((doc ) => Document.fromJson(doc)).toList();
        _transactionTitles =
            documentList.map((doc) => doc['title'].toString()).toList();
      });
    } catch (e) {
      debugPrint('Error loading JSON file: $e');
    }
  }

  void _openTransactionUrl(String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFViewerScreen(pdfUrl: url),
      ),
    );
  }

  Widget _buildDocumentRow(String title) {
    return InkWell(
      onTap: () async {
        final String url = _loadedDocuments
            .firstWhere((doc ) => doc.title == title)
            .url;
        _openTransactionUrl(url);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Image.asset("assets/eye.png"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customAppBar(context, "Transaction Document"),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Transaction Address"),
                Text(widget.address),
                const SizedBox(height: 15.0),
                const Divider(height: 1, thickness: 0.1, color: Colors.grey),
                const SizedBox(height: 15.0),
                const Text("Transaction ID"),
                Text(widget.id),
                const SizedBox(height: 15.0),
                const Divider(height: 1, thickness: 0.1, color: Colors.grey),
                const SizedBox(height: 15.0),
                const Text("Document Name"),
                for (var title in _transactionTitles)
                  _buildDocumentRow(title),
              ],
            ),
          ),
        ],
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
      appBar: AppBar(title: Text("PDF Viewer")),
      body: SfPdfViewer.network(
        pdfUrl,
        controller: PdfViewerController(),
      ),
    );
  }
}
