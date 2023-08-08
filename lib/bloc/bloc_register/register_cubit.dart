import 'package:bloc/bloc.dart';
import 'package:fierbase_auth/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../firebase/fb_auth/fb_auth.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of<RegisterCubit>(context);

  late TextEditingController emailController;
  late TextEditingController passController;
  late TextEditingController usernameController;
  late TextEditingController phoneController;
  var formKey = GlobalKey<FormState>();

  void initState(){
    emailController = TextEditingController();
    passController = TextEditingController();
    usernameController = TextEditingController();
    phoneController = TextEditingController();
    emit(RegisterInitial());
  }
  bool obscureText = true;
  bool isVisible = false;
  void visibilityPass(){
    obscureText = !obscureText;
    isVisible = !isVisible;
    emit(RegisterVisibilityPass());
  }
  UserModel get user{
    UserModel userModel = UserModel();
    userModel.phone = phoneController.text;
    userModel.email = emailController.text;
    userModel.name = usernameController.text;
    return userModel;
  }
  void register(context)async{
    emit(RegisterLoading());
    bool loggedIn = await FBAuth.registerUser(context, email: emailController.text, password: passController.text,model: user);
    if (loggedIn) {
      emit(RegisterSuccess());
    }  else{
      emit(RegisterError());
    }
  }
  void registerGoogle()async{
    User? user = await FBAuth.signInWithGoogle();
    if (user != null) {
      emit(RegisterGoogleSuccess());
    }else{
      emit(RegisterGoogleError());
    }
  }


}
