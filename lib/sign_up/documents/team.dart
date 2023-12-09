import 'package:flutter/material.dart';
import 'commonwidgte.dart';

class TeamDocument extends StatefulWidget {
  const TeamDocument({super.key});

  @override
  State<TeamDocument> createState() => _TeamDocumentState();
}

class _TeamDocumentState extends State<TeamDocument> {
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
                customListTile("Cheque", "15 MB"),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.1,
                ),
                customListTile("Settlement Document", "15 MB"),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.1,
                ),
                customListTile("ICA Document", "15 MB"),
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
