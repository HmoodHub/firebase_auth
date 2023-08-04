import 'package:fierbase_auth/bloc/bloc_login/login_cubit.dart';
import 'package:fierbase_auth/screens/auth/register_screen.dart';
import 'package:fierbase_auth/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../widget/widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit bloc = LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
       if (state is LoginSuccess) {
         Get.off(HomeScreen());
       }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Form(
            key: bloc.formKey,
            child: ListView(
              padding: const EdgeInsets.all(15),
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Welcome back',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'enter data to Login in firebase authentication app....',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(
                  height: 50,
                ),
                textFormFieldApp(
                  controller: bloc.emailController,
                  type: TextInputType.emailAddress,
                  hint: 'E-mail',
                  prefixIcon: Icons.email,
                ),
                const SizedBox(
                  height: 10,
                ),
                textFormFieldApp(
                  controller: bloc.passController,
                  type: TextInputType.visiblePassword,
                  hint: 'Password',
                  // onSubmit: (p0) => bloc.login(),
                  prefixIcon: Icons.lock,
                  suffix:
                      bloc.isVisible ? Icons.visibility_off : Icons.visibility,
                  obscureText: bloc.obscureText,
                  onPressedSuffix: () => bloc.visibilityPass(),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Forget Password?',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.blue,
                        ),
                    textAlign: TextAlign.right,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () {
                      bloc.login();
                    },
                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.button,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'nt have an account?',
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => const RegisterScreen(),
                        );
                      },
                      child: const Text(
                        ' Sign Up',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
