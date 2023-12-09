import 'package:flutter/material.dart';

import 'commonwidgte.dart';

class JoiningDocument extends StatefulWidget {
  const JoiningDocument({super.key});

  @override
  State<JoiningDocument> createState() => _JoiningDocumentState();
}

class _JoiningDocumentState extends State<JoiningDocument> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customAppBar(context,"Joining Document"),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                customListTile("Cheque", "15 MB"),
                Divider(color: Colors.grey,thickness: 0.1,),
                customListTile("Settlement Document", "15 MB"),
                Divider(color: Colors.grey,thickness: 0.1,),
                customListTile("ICA Document", "15 MB"),
                Divider(color: Colors.grey,thickness: 0.1,),
              ],
            ),
          )
        ],
      ),
    );
  }
}


