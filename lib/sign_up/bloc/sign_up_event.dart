import 'package:flutter/material.dart';

@immutable
abstract class RegisterEvent {}
class RegisterTextChangedEvent extends RegisterEvent{
  final String emailId;
  final String phoneNumber;
  RegisterTextChangedEvent(this.emailId,this.phoneNumber);
}
class RegiterSubmittedEvent extends RegisterEvent{
  final String emailId;
  final String phoneNumber;
  RegiterSubmittedEvent(this.emailId,this.phoneNumber); 
}

