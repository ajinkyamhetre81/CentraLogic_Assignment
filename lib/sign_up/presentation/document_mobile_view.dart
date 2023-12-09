import 'package:assignment/sign_up/documents/joining.dart';
import 'package:flutter/material.dart';

import '../documents/tax.dart';
import '../documents/team.dart';
import '../documents/transaction.dart';

class MobileScreen extends StatefulWidget {
  @override
  _MobileScreenState createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
   Scaffold(appBar: AppBar(title: Text("Home page",style: TextStyle(color: Colors.black),),elevation: 0,centerTitle: true,backgroundColor: Colors.white,),),
    DocumentPage(),
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
        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            label:'Home',
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
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                setState(() {
                  _currentIndex = 0; // Navigate to the Home page
                });
              },
            ),
            ListTile(
              title: Text('Documents'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" Documents",style: TextStyle(color: Colors.black),),elevation: 0,centerTitle: true,backgroundColor: Colors.white,),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal:18.0),
        children: [
          ListTile(
            title: Text('Joining Documents',style: TextStyle(fontSize: 22),),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> JoiningDocument()));
            },
          ),
          Divider(color: Colors.grey,height: 1,thickness: 0.1,),
          ListTile(
            title: Text('Transaction Documents',style: TextStyle(fontSize: 22),),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> TransactionDocument()));
            },
          ),
          Divider(color: Colors.grey,height: 1,thickness: 0.1,),
          ListTile(
            title: Text('Team Documents',style: TextStyle(fontSize: 22),),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> TeamDocument()));
            },
          ),
          Divider(color: Colors.grey,height: 1,thickness: 0.1,),
          ListTile(
            title: Text('Tax Documents',style: TextStyle(fontSize: 22),),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> TaxDocument()));
            },
          ),
          Divider(color: Colors.grey,height: 1,thickness: 0.1,),
        ],
      ),
    );
  }
}

class DocumentMenuItem extends StatelessWidget {
  final String title;

  DocumentMenuItem(this.title);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,style: TextStyle(fontSize: 22),),
      trailing: Icon(Icons.chevron_right),
      onTap: () {

      },
    );
  }
}
