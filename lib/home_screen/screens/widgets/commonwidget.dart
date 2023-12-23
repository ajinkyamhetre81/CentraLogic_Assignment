import 'package:assignment/home_screen/screens/document_UI/transactiondocument_details.dart';
import 'package:flutter/material.dart';

Widget customAppBar(context, String title) {
  return LayoutBuilder(builder: (context, constraints) {
    return constraints.maxWidth > 700
        ? const SizedBox(
            height: 0,
            width: 0,
          )
        : AppBar(
          title: Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
  });
}

Widget customListTile(String title, String size,String url,BuildContext context) {
    return ListTile(
      leading: Image.asset(
        "assets/pdflogo.png",
        height: 34,
        width: 34,
        fit: BoxFit.contain,
      ),
      contentPadding: const EdgeInsets.all(0),
      minVerticalPadding: 0,
      title: Text(title),
      subtitle: Text(size),
      trailing: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PDFViewerScreen(pdfUrl: url.toString()),
            ),
          );
        },
        child: Image.asset("assets/eye.png"),
      ),
    );
  }