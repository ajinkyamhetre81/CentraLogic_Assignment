import 'package:assignment/sign_up/bloc/sign_up_event.dart';
import 'package:assignment/sign_up/bloc/sign_up_state.dart';
import 'package:assignment/sign_up/presentation/document_dekstop_view.dart';
import 'package:assignment/sign_up/presentation/document_mobile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assignment/sign_up/bloc/sign_up_bloc.dart';

class ResponsiveRegisterPage extends StatefulWidget {
  const ResponsiveRegisterPage({Key? key}) : super(key: key);
  @override
  _ResponsiveRegisterPageState createState() => _ResponsiveRegisterPageState();
}
class _ResponsiveRegisterPageState extends State<ResponsiveRegisterPage> {
  final phoneController=TextEditingController();
  final emailController=TextEditingController();
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: LayoutBuilder(
        builder:(context,constraints){
          if (constraints.maxWidth>800){                                 //for desktop view trail
            return Row(
              children:[
                Expanded(
                  child:Image.asset("images/home.png",fit: BoxFit.fill),
                ),
                Expanded(
                  child:SingleChildScrollView(
                    child:Padding(
                      padding:const EdgeInsets.all(56.0),
                      child:_buildCommonUI(),
                    ),
                  ),
                ),
              ],
            );
          } 
          else{                                                                                              //  /for Mobile view
            return SingleChildScrollView(
              child:Column(
                children:[
                  Image.asset("images/home.png",fit: BoxFit.fill,width: 600,),
                  Padding(
                    padding:const EdgeInsets.all(20.0),
                    child:_buildCommonUI(),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

 Widget _buildCommonUI(){
  return Column(
    crossAxisAlignment:CrossAxisAlignment.center,
    children:[ 
      Column(
        mainAxisAlignment:MainAxisAlignment.start,
        children:[
          Image.asset("images/centrajob.png", width: 400),        
        ],
      ),
      const SizedBox(height:15),
      const Text("Log In With",style:TextStyle(fontSize: 23),),
      const SizedBox(height: 15),
      Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children:[
          Container(
            height:60,
            width:60,
            padding:const EdgeInsets.all(7),
            decoration:BoxDecoration(
              border:Border.all(color: Colors.grey),
              borderRadius:BorderRadius.circular(5),
            ),
            child:Image.asset("images/google.png"),
          ),
          const SizedBox(width: 15),
          Container(
            height:60,
            width:60,
            padding:const EdgeInsets.all(10),
            decoration:BoxDecoration(
              border:Border.all(color: Colors.grey),
              borderRadius:BorderRadius.circular(5),
            ),
            child:Image.asset("images/facebook.png"),
          ),
          const SizedBox(width: 15),
          Container(
            height:60,
            width:60,
            padding:const EdgeInsets.all(7),
            decoration:BoxDecoration(
              border:Border.all(color:Colors.grey),
              borderRadius:BorderRadius.circular(5),
            ),
            child:Image.asset("images/ios.png"),
          ),
        ],
      ),
      SizedBox(width:MediaQuery.of(context).size.width,height:10),
      Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children:[
          Container(
            width:MediaQuery.of(context).size.width / 6,
            height:1,
            color:Colors.grey,
          ),
          Text(" OR ",style:TextStyle(color:Colors.grey.shade700),),
          Container(
            width: (MediaQuery.of(context).size.width / 6),
            height: 1,
            color: Colors.grey,
          ),
        ],
      ),
      SizedBox(width: MediaQuery.of(context).size.width,height: 10),
      SizedBox(
        width:400,
        child:Form(
          key:_formKey,
          child:Column(
            crossAxisAlignment:CrossAxisAlignment.end,
            children:[
              TextFormField(
                controller:phoneController,
                keyboardType:TextInputType.phone,
                decoration:InputDecoration(
                  hintText:"  Enter Phone No.",
                  hintStyle:const TextStyle(fontSize: 18),
                  filled:true,
                  fillColor:const Color.fromARGB(255, 185, 226, 245),
                  prefixIcon:const Padding(
                    padding:EdgeInsets.only(left: 15.0),
                    child:Icon(Icons.call_outlined, size: 30),
                  ),
                  contentPadding:const EdgeInsets.symmetric(vertical:20),
                  errorStyle: TextStyle(color: Colors.red.shade900,),
                  border:OutlineInputBorder(
                    borderSide:BorderSide.none,
                    borderRadius:BorderRadius.circular(5),
                  ),
                ),
                validator:(value){
                  if (value==null||value.isEmpty ||value.length!= 10 ||int.tryParse(value)==null) {
                    return "Please enter a valid 10-digit phone number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text("Optional*"),
              const SizedBox(height: 3),
              TextFormField(
                controller:emailController,
                keyboardType:TextInputType.emailAddress,
                decoration:InputDecoration(
                  hintText:"  Enter Email address",
                  hintStyle:const TextStyle(fontSize: 18),
                  filled:true,
                  fillColor:Colors.lightBlue.shade100,
                  prefixIcon:const Padding(
                    padding:EdgeInsets.only(left: 15.0),
                    child:Icon(Icons.mail_outline_outlined, size: 30),
                  ),
                  contentPadding:const EdgeInsets.symmetric(vertical: 20),
                  errorStyle:TextStyle(color:Colors.red.shade900),
                  border:OutlineInputBorder(
                    borderSide:BorderSide.none,
                    borderRadius:BorderRadius.circular(5),
                  ),
                ),
                validator:(value) {
                  if (value==null||value.isEmpty) {
                    return "Please enter an email address";
                  }
                  final gmailRegExp=RegExp(r'@gmail\.com$');
                  if (!gmailRegExp.hasMatch(value)) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 30.0),
      SizedBox(
        width: 400,
        child: BlocConsumer<RegisterBloc, RegisterState>(
        builder:(context, state) {
          return CupertinoButton(
            onPressed:() {
              if (_formKey.currentState!.validate()) {
                debugPrint("OTP generated Successfully");
              }
              if (state is! RegisterValidState) {
                BlocProvider.of<RegisterBloc>(context).add(
                  RegiterSubmittedEvent(emailController.text,phoneController.text),
                );
              }
            },
            padding:
                const EdgeInsets.symmetric(vertical:12.0, horizontal:16.0),
            color: const Color.fromARGB(255, 21, 70, 95),
            borderRadius: BorderRadius.circular(8.0),
            child: const Text(
              "Log in",
              style: TextStyle(fontSize: 20),
            ),
          );
        },
        listener: (context,state) {
          if (state is RegisterSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:Text(state.successMessage),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>MediaQuery.of(context).size.width>600?DekstopScreen(): MobileScreen()),
              );
            
          } else if (state is RegisterErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
      ),
      ),
      const SizedBox(
        height:16.0
      ),
      const Column(
        mainAxisAlignment:MainAxisAlignment.end,
        children: [
          Text(
            "@2023, CentraLogic Pvt Ltd, All Rights Reserved",
            style: TextStyle(
              fontSize:15,
              color:Colors.grey,
              ),
            ),
        ],
      ),
    ],
  );
}
}
