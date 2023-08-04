import 'package:fierbase_auth/bloc/bloc_login/login_cubit.dart';
import 'package:fierbase_auth/bloc/bloc_register/register_cubit.dart';
import 'package:fierbase_auth/screens/auth/launch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
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
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const LaunchScreen(),
      ),
    );
  }
}

