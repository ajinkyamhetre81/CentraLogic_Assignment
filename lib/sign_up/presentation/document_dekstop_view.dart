import 'package:assignment/sign_up/documents/joining.dart';
import 'package:assignment/sign_up/documents/tax.dart';
import 'package:assignment/sign_up/documents/team.dart';
import 'package:assignment/sign_up/documents/transaction.dart';
import 'package:flutter/material.dart';

class SideNavBar extends StatefulWidget {
  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  int currentTabIndex=1;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: [
          if (screenWidth > 600)
            Container(
              width: 246,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "images/logo.png",
                      width: 198,
                      height: 43.26,
                    ),
                    Divider(
                      thickness: 0.1,
                      color: Colors.black,
                    ),
                    ListTile(
                      leading: IconButton(
                        icon: Icon(Icons.home),
                        onPressed: () => {},
                      ),
                      title: Text('Home'),
                      onTap: () {
                        // Handle home navigation
                      },
                    ),
                    ListTile(
                      leading: IconButton(
                        icon: Icon(Icons.document_scanner),
                        onPressed: () => {},
                      ),
                      title: Text('Documents'),
                      onTap: () {
                        // Handle documents navigation
                      },
                    ),
                  ],
                ),
              ),
            ),
          VerticalDivider(
            thickness: 0.1,
            color: Colors.black,
          ),
          Expanded(
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 68,
                actions: [
                  Container(
                    width: 142,
                    height: 42,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 0.1,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundImage: NetworkImage('images/charles.png'),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Charles',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              body: Container(
                height: 340,
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Documents",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            InkWell(
                              onTap:() {
                                setState(() {
                                  currentTabIndex=1;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(currentTabIndex ==1 ? 10:0),
                                    topRight: Radius.circular(currentTabIndex ==1 ? 10:0)  
                                  ),
                                  color: currentTabIndex==1 ? const Color.fromARGB(255, 21, 58, 131) : Colors.grey.shade200
                                  
                                ),
                                child: Text("Joining Document",style: TextStyle(color: currentTabIndex==1 ?Colors.white :Colors.grey),)
                              ),
                            ),
                            InkWell(
                              onTap:() {
                                setState(() {
                                  currentTabIndex=2;
                                });
                              },
                              
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(currentTabIndex==2 ? 10:0),
                                  color: currentTabIndex==2 ? const Color.fromARGB(255, 21, 58, 131) : Colors.grey.shade200
                                ),
                                child: Text("Transaction Document",style: TextStyle(color: currentTabIndex==2 ?Colors.white :Colors.grey))
                              ),
                            ),
                            InkWell(
                              onTap:() {
                                setState(() {
                                  currentTabIndex=3;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(currentTabIndex==3 ? 10:0),
                                  color: currentTabIndex==3 ? const Color.fromARGB(255, 21, 58, 131) : Colors.grey.shade200
                                ),
                                child: Text("Team Document",style: TextStyle(color: currentTabIndex==3 ?Colors.white :Colors.grey))
                              ),
                            ),
                            InkWell(
                              onTap:() {
                                setState(() {
                                  currentTabIndex=4;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(currentTabIndex ==4 ? 10:0),
                                    topLeft: Radius.circular(currentTabIndex ==4 ? 10:0)  
                                  ),                                  
                                color: currentTabIndex==4 ? const Color.fromARGB(255, 21, 58, 131) : Colors.grey.shade200
                                ),
                                child: Text("Tax Document",style: TextStyle(color: currentTabIndex==4 ?Colors.white :Colors.grey))
                              ),
                            ),
                          ],
                        ),


                        SizedBox(height: 10),
                       
                        currentTabIndex==1?JoiningDocument():currentTabIndex==2?TransactionDocument():currentTabIndex==3?TeamDocument():TaxDocument()

                      ],
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}













// // TabBar(
// //                               indicator: BoxDecoration(
// //                                 color: const Color.fromARGB(255, 17, 55, 86),
// //                                 borderRadius: BorderRadius.circular(10.0),
// //                               ),
// //                               indicatorSize: TabBarIndicatorSize.tab,
// //                               tabs: const [
// //                                 Tab(
                              
// //                                   child: Text(
// //                                     'Joining Document',
// //                                     style: TextStyle(
// //                                         fontWeight: FontWeight.bold,
// //                                         fontSize: 16,
// //                                         color: Colors.grey),
// //                                   ),
// //                                 ),
// //                                 Tab(
// //                                   child: Text(
// //                                     'Transaction Document',
// //                                     style: TextStyle(
// //                                         fontWeight: FontWeight.bold,
// //                                         fontSize: 16,
// //                                         color: Colors.grey),
// //                                   ),
// //                                 ),
// //                                 Tab(
// //                                   child: Text(
// //                                     'Team Document',
// //                                     style: TextStyle(
// //                                         fontWeight: FontWeight.bold,
// //                                         fontSize: 16,
// //                                         color: Colors.grey),
// //                                   ),
// //                                 ),
// //                                 Tab(
// //                                   child: Text(
// //                                     'Tax Document',
// //                                     style: TextStyle(
// //                                         fontWeight: FontWeight.bold,
// //                                         fontSize: 16,
// //                                         color: Colors.grey),
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),