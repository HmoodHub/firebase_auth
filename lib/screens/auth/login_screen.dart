import 'package:fierbase_auth/bloc/bloc_login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widget/widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    LoginCubit bloc = LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(),
      body:  Form(
        key: bloc.formKey,
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            const SizedBox(height: 50,),
            Text(
              'Welcome back',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Enter data to Login....',
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(
              height: 100,
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
              onTap: (){

              },
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
            ElevatedButton(onPressed: (){}, child:  Text('Login',style: Theme.of(context).textTheme.button,)),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'nt have an account?',),
                InkWell(onTap: (){},child: const Text(' Sign Up',style: TextStyle(color: Colors.blue),),),
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
