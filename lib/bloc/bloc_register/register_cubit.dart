import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

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
}
