import 'package:bloc/bloc.dart';
import 'package:fierbase_auth/firebase/fb_auth/fb_auth.dart';
import 'package:fierbase_auth/shared_pref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../model/user_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  void showSnackbar(BuildContext context) {
     SnackBar snackBar = SnackBar(
      content: Text('Please virfey email'),
      // duration: Duration(seconds: 2),
      action: SnackBarAction(label: 'SEND', onPressed: () async => verifiedEmail(),),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    emit(HomeShowSnacBar());
  }


  UserModel? model;
  void getData()async {
    model = UserModel.fromJson(await FBAuth.getDataUser());
    if (model != null) {
      emit(HomeUserData(model!));
    }  else{
      emit(HomeUserDataError());
    }
  }
  void signOut()async{
    bool logout = await FBAuth.logout();
    if (logout) {
      emit(LogoutSuccess());
    }  else{
      emit(LogoutError());
    }
  }
  void verifiedEmail()async{
    bool verified = await FBAuth.verifiedEmail();
    if (verified) {
      emit(VerifiedEmailSuccess());
    }  else{
      emit(VerifiedEmailError());
    }
  }
}
