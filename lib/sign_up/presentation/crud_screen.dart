import 'package:flutter/material.dart';

class CRUDScreen extends StatefulWidget {
  const CRUDScreen({Key? key}) : super(key: key);
  @override
  CRUDScreenState createState() => CRUDScreenState();
}

class CRUDScreenState extends State<CRUDScreen> {
  final List<List<String>> dataList = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  void addNewData() {
    setState(() {
      String name = nameController.text;
      String contact = contactController.text;
      String email = emailController.text;

      List<String> newData = [name, contact, email];

      dataList.add(newData);
      nameController.clear();
      contactController.clear();
      emailController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crud Operations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: contactController,
                    decoration: const InputDecoration(labelText: 'Contact'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: addNewData,
                  child: const Text('Add'),
                ),
              ],
            ),
            const SizedBox(height: 60),
            const Text(
              "Details",
              style: TextStyle(fontSize: 30, color: Colors.blue),
            ),
            DataTable(
              columns: const [
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Contact')),
                DataColumn(label: Text('Email')),
              ],
              rows: dataList.map((data) {
                return DataRow(
                  cells: [
                    DataCell(Text(data[0])),
                    DataCell(Text(data[1])),
                    DataCell(Text(data[2])),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
