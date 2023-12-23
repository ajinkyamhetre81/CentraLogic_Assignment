import 'package:assignment/home_screen/screens/document_UI/joining.dart';
import 'package:flutter/material.dart';

import '../document_UI/tax.dart';
import '../document_UI/team.dart';
import '../document_UI/transaction.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  _MobileScreenState createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home page",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
    ),
    const DocumentPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Documents',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _currentIndex = 0; // Navigate to the Home page
                });
              },
            ),
            ListTile(
              title: const Text('Documents'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _currentIndex = 1; // Navigate to the Documents page
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DocumentPage extends StatelessWidget {
  const DocumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " Documents",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        children: [
          ListTile(
            title: const Text(
              'Joining Documents',
              style: TextStyle(fontSize: 22),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const JoiningDocument()));
            },
          ),
          const Divider(
            color: Colors.grey,
            height: 1,
            thickness: 0.1,
          ),
          ListTile(
            title: const Text(
              'Transaction Documents',
              style: TextStyle(fontSize: 22),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TransactionDocument()));
            },
          ),
          const Divider(
            color: Colors.grey,
            height: 1,
            thickness: 0.1,
          ),
          ListTile(
            title: const Text(
              'Team Documents',
              style: TextStyle(fontSize: 22),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TeamDocument()));
            },
          ),
          const Divider(
            color: Colors.grey,
            height: 1,
            thickness: 0.1,
          ),
          ListTile(
            title: const Text(
              'Tax Documents',
              style: TextStyle(fontSize: 22),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TaxDocument()));
            },
          ),
          const Divider(
            color: Colors.grey,
            height: 1,
            thickness: 0.1,
          ),
        ],
      ),
    );
  }
}
