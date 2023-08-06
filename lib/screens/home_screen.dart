import 'package:fierbase_auth/bloc/bloc_home/home_cubit.dart';
import 'package:fierbase_auth/screens/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit bloc = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          Get.off(
            const LoginScreen(),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('MyApp'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () async => bloc.signOut(),
                icon: const Icon(Icons.logout),
              ),
              IconButton(
                onPressed: () async {
                  bloc.getData();
                  if (bloc.model != null) {
                    print(bloc.model!.email);
                    print(FirebaseAuth.instance.currentUser!.emailVerified);
                    if (FirebaseAuth.instance.currentUser!.emailVerified ==
                        false) {
                      bloc.showSnackbar(context);
                    }
                  }
                },
                icon: const Icon(Icons.info),
              ),
            ],
          ),
        );
      },
    );
  }
}
