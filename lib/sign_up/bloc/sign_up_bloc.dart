import 'package:bloc/bloc.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

class RegisterBloc extends Bloc<RegisterEvent,RegisterState> {
  RegisterBloc():super(RegisterInitialState()){

    // on<RegiterSubmittedEvent>((event, emit)  {        //trial -->> works
    //   emit(RegisterSuccessState("OTP Generated Successfully"));
    // });   
    on<RegiterSubmittedEvent>((event, emit){
      final gmailRegExp=RegExp(r'@gmail\.com$');
      if(event.phoneNumber.length != 10) {
        emit(RegisterErrorState("Please enter a valid 10-digit phone number"));
      }
      else if(event.phoneNumber.length==10 && int.tryParse(event.phoneNumber)==null){
      emit(RegisterErrorState("Only numerics are allowed"));
      }
      else if(!gmailRegExp.hasMatch(event.emailId)) {
        emit(RegisterErrorState("Please enter a valid email address"));
      }
       else{
        emit(RegisterSuccessState("Logged in  Successfully"));
      }
    }); 
  }
}
