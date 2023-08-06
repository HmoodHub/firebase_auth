import 'package:bloc/bloc.dart';
import 'package:fierbase_auth/firebase/fb_auth/fb_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);

  var formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passController;

  void initState() {
    emailController = TextEditingController();
    passController = TextEditingController();
    emit(LoginInitial());
  }

  bool obscureText = true;
  bool isVisible = false;

  void visibilityPass() {
    obscureText = !obscureText;
    isVisible = !isVisible;
    emit(LoginVisibilityPass());
  }

  void login(context)async{
    emit(LoginLoading());
   bool loggedIn = await FBAuth.loginUser(context, email: emailController.text, password: passController.text);
   if (loggedIn) {
     emit(LoginSuccess());
   }  else{
     emit(LoginError());
   }
  }
}
