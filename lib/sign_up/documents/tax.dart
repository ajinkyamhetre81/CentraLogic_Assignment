import 'package:flutter/material.dart';

import 'commonwidgte.dart';

class TaxDocument extends StatefulWidget {
  const TaxDocument({super.key});

  @override
  State<TaxDocument> createState() => _TaxDocumentState();
}

class _TaxDocumentState extends State<TaxDocument> {
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
                customListTile("1099", "15 MB"),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.1,
                ),
                customListTile("W9", "15 MB"),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.1,
                ),
                customListTile("Tax Statement", "15 MB"),
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
