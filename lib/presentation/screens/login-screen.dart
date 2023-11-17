import 'package:flutter/material.dart';
import 'package:shop_app/presentation/screens/register_screen.dart';

import '../../core/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool visiblePassword = false;

//bool isPassword=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LOGIN',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.black87),
                ),
                Text(
                  'Login now to get our hot offers',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                defaultFormField(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'please enter your email address';
                    }
                    return '';
                  },
                  label: 'Email address',
                  prefix: Icons.email_outlined,
                  suffixPressed: () {},
                ),
                const SizedBox(
                  height: 15.0,
                ),
                defaultFormField(
                  controller: passwordController,
                  type: TextInputType.number,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'please enter your password';
                    }
                    return '';
                  },
                  label: 'Password',
                  isPassword: visiblePassword,
                  prefix: Icons.lock_outline,
                  suffix:
                      visiblePassword ? Icons.visibility : Icons.visibility_off,
                  suffixPressed: () {
                    setState(() {
                      if (visiblePassword == false) {
                        visiblePassword = true;
                      } else {
                        visiblePassword = false;
                      }
                    });
                  },
                ),
                const SizedBox(height: 30.0),
                defaultButton(
                    function: () {}, text: "Login", isUpperCase: true),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    defaultTextButton(
                      function: () {
                        navigateTo(context, const RegisterScreen());
                      },
                      text: 'Register',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
