
abstract class RegisterState {}

class RegisterInitialState extends RegisterState{}

class RegisterValidState extends RegisterState{}

class RegisterErrorState extends RegisterState{
  final String errorMessage;
  RegisterErrorState(this.errorMessage);
}
class RegisterSuccessState extends RegisterState{
  final String successMessage;
  RegisterSuccessState(this.successMessage);
}
