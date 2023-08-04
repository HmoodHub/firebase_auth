import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../bloc/bloc_register/register_cubit.dart';
import '../../widget/widget.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterCubit bloc = RegisterCubit.get(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          Get.back();
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
                Text(
                  'Register Now',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'enter data to Register in firebase Authentication....',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(
                  height: 30,
                ),
                textFormFieldApp(
                  controller: bloc.usernameController,
                  type: TextInputType.emailAddress,
                  hint: 'User name',
                  prefixIcon: Icons.email,
                ),
                const SizedBox(
                  height: 10,
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
                  prefixIcon: Icons.lock,
                  suffix:
                      bloc.isVisible ? Icons.visibility_off : Icons.visibility,
                  obscureText: bloc.obscureText,
                  onPressedSuffix: () => bloc.visibilityPass(),
                ),
                const SizedBox(
                  height: 10,
                ),
                textFormFieldApp(
                  controller: bloc.phoneController,
                  type: TextInputType.number,
                  hint: 'Phone',
                  prefixIcon: Icons.phone,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    bloc.register();
                  },
                  child: Text(
                    'Register',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Do have an account?',
                      style: TextStyle(color: Colors.black),
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Text(
                        ' Login',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
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
