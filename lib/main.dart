import 'package:fierbase_auth/bloc/bloc_login/login_cubit.dart';
import 'package:fierbase_auth/bloc/bloc_register/register_cubit.dart';
import 'package:fierbase_auth/screens/auth/launch_screen.dart';
import 'package:fierbase_auth/shared_pref/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'bloc/bloc_home/home_cubit.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPref().initPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
             BlocProvider<LoginCubit>(
              create: (BuildContext context) => LoginCubit()..initState(),
            ),
        BlocProvider<RegisterCubit>(
          create: (BuildContext context) => RegisterCubit()..initState(),
        ),
        BlocProvider<HomeCubit>(
          create: (BuildContext context) => HomeCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'REM',
          useMaterial3: true,
        ),
        home: const LaunchScreen(),
      ),
    );
  }
}

