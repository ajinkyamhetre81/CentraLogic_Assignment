import 'package:flutter/material.dart';

class SideNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavigationRail(
      selectedIndex: null,
      minWidth: 200,
      labelType: NavigationRailLabelType.all,
      destinations: [
        NavigationRailDestination(
          icon: Icon(Icons.house_outlined),
          selectedIcon: Icon(Icons.house),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.document_scanner_outlined),
          selectedIcon: Icon(Icons.document_scanner),
          label: Text('Document'),
        ),
      ], 
    )
      ],
    );
  }
}

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text(
            'Main Content Goes Here',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}

class CombinedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideNavBar(),
          VerticalDivider(thickness: 1, width: 1), // Adjust thickness and width as needed
          MainContent(),
        ],
      ),
    );
  }
}
