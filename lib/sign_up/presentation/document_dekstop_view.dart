import 'package:assignment/sign_up/documents/joining.dart';
import 'package:assignment/sign_up/documents/tax.dart';
import 'package:assignment/sign_up/documents/team.dart';
import 'package:assignment/sign_up/documents/transaction.dart';
import 'package:flutter/material.dart';

class DekstopScreen extends StatefulWidget {
  const DekstopScreen({super.key});

  @override
  State<DekstopScreen> createState() => _DekstopScreenState();
}

class _DekstopScreenState extends State<DekstopScreen> {
  int _selectedIndex = 1;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;

  double groupAlignment = -1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset("images/logo.png"),
              ),
              Center(
                child: Container(
                  height: 0.5,
                  width: 200,
                  margin: const EdgeInsets.all(15),
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                  width: 200,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.asset("images/homeIcon.png"),
                        title: const Text('Home'),
                        onTap: () {
                          setState(() {
                            _selectedIndex = 1;
                          });
                        },
                      ),
                      ListTile(
                        leading: Image.asset("images/documentIcon.png"),
                        title: const Text('Documents'),
                        onTap: () {
                          setState(() {
                            _selectedIndex = 2;
                          });
                        },
                      ),
                    ],
                  )),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
              child: _selectedIndex == 1
                  ? const Center(
                      child: Text("Home page"),
                    )
                  : const DocumentTypes()),
        ],
      ),
    );
  }
}

class DocumentTypes extends StatefulWidget {
  const DocumentTypes({super.key});

  @override
  State<DocumentTypes> createState() => _DocumentTypesState();
}

class _DocumentTypesState extends State<DocumentTypes> {
  int currentTabIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(
          height: 0,
          width: 0,
        ),
        toolbarHeight: 150,
        leadingWidth: 0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.grey, width: 0.4)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage('images/charles.png'),
                      ),
                      SizedBox(width: 8),
                      Text("Charles"),
                      SizedBox(
                        width: 10,
                      ),
                      
                      Icon(Icons.keyboard_arrow_down_outlined)
                    ],
                  ),
                ),
              ],
            ),
            const Text(
              "Documents",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentTabIndex = 1;
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: const Radius.circular(10),
                                topLeft: const Radius.circular(10),
                                bottomRight: Radius.circular(
                                    currentTabIndex == 1 ? 10 : 0),
                                topRight: Radius.circular(
                                    currentTabIndex == 1 ? 10 : 0)),
                            color: currentTabIndex == 1
                                ? const Color.fromARGB(255, 21, 58, 131)
                                : Colors.grey.shade200),
                        child: Text(
                          "Joining Document",
                          style: TextStyle(
                              color: currentTabIndex == 1
                                  ? Colors.white
                                  : Colors.grey),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentTabIndex = 2;
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                currentTabIndex == 2 ? 10 : 0),
                            color: currentTabIndex == 2
                                ? const Color.fromARGB(255, 21, 58, 131)
                                : Colors.grey.shade200),
                        child: Text("Transaction Document",
                            style: TextStyle(
                                color: currentTabIndex == 2
                                    ? Colors.white
                                    : Colors.grey))),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentTabIndex = 3;
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                currentTabIndex == 3 ? 10 : 0
                              ),
                            color: currentTabIndex == 3
                                ? const Color.fromARGB(255, 21, 58, 131)
                                : Colors.grey.shade200),
                        child: Text("Team Document",
                            style: TextStyle(
                                color: currentTabIndex == 3
                                    ? Colors.white
                                    : Colors.grey))),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentTabIndex = 4;
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: const Radius.circular(10),
                                topRight: const Radius.circular(10),
                                bottomLeft: Radius.circular(
                                    currentTabIndex == 4 ? 10 : 0),
                                topLeft: Radius.circular(
                                    currentTabIndex == 4 ? 10 : 0)),
                            color: currentTabIndex == 4
                                ? const Color.fromARGB(255, 21, 58, 131)
                                : Colors.grey.shade200),
                        child: Text("Tax Document",
                            style: TextStyle(
                                color: currentTabIndex == 4
                                    ? Colors.white
                                    : Colors.grey))),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: currentTabIndex == 1
          ? const JoiningDocument()
          : currentTabIndex == 2
              ? const TransactionDocument()
              : currentTabIndex == 3
                  ? const TeamDocument()
                  : const TaxDocument(),
    );
  }
}
