import 'package:assignment/sign_up/presentation/document_dekstop_view.dart';
import 'package:assignment/sign_up/presentation/responsive_layout.dart';
import 'package:assignment/sign_up/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const DekstopScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Welcome !",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Please register to proceed",
              style: TextStyle(
                fontSize: 17
              ),  
            ),
            ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider(
                            create: (context) => RegisterBloc(),
                            child: const ResponsiveRegisterPage(),
                          )));
            },
            child: const Text(
              "Register",
              style: TextStyle(fontSize: 20),
            )),

          ],
        )      ),
    );
  }
}
