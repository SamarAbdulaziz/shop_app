import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/components.dart';
import 'package:shop_app/core/constant.dart';
import 'package:shop_app/data/local_data_source/cache_helper.dart';
import 'package:shop_app/presentation/manager/register_cubit/register_cubit.dart';
import 'package:shop_app/presentation/manager/register_cubit/states.dart';
import 'package:shop_app/presentation/view/screens/home_screen.dart';
import 'package:shop_app/presentation/view/screens/login-screen.dart';
import 'package:shop_app/presentation/view/widgets/custom_widget/custom_auth_button.dart';
import 'package:shop_app/presentation/view/widgets/custom_widget/custom_text_form_field_widget.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwdController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopAppRegisterStates>(
        listener: (context, state) {
          if (state is ShopAppSuccessRegisterStates) {
            if (state.registerModel.status == true) {
              print(state.registerModel.message);
              print(state.registerModel.data!.token);
              showToast(
                  msg: state.registerModel.message!,
                  state: ToastStates.success);

              CacheHelper.saveData(
                      key: 'token', value: state.registerModel.data?.token)
                  .then((value) {
                token = state.registerModel.data?.token;
                print("token saved");
                navigateAndFinish(context, const HomeScreen());
              });
            } else {
              print(state.registerModel.message);
              showToast(
                  msg: state.registerModel.message!,
                  state: ToastStates.error);
            }
          }
        },
        builder: (context, state) {
          ShopRegisterCubit cubit = ShopRegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Center(
                child: SingleChildScrollView(
                    child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //title of screen
                    Text(
                      "Sign-up",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: Colors.black),
                    ),
                    //DEscription of screen
                    Text(
                      "Sign-up to browse our hot offers",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //name
                    defaultTextForm(
                        msg: 'please enter your Name',
                        type: TextInputType.name,
                        labelText: "Name",
                        hintText: "Test",
                        controller: nameController,
                        icon: Icons.person),
                    const SizedBox(
                      height: 15,
                    ),
                    //phone
                    defaultTextForm(
                        msg: 'please enter your phone',
                        type: TextInputType.phone,
                        labelText: "phone",
                        hintText: "01xxxxxxxxx",
                        controller: phoneController,
                        icon: Icons.phone),
                    const SizedBox(
                      height: 15,
                    ),

                    defaultTextForm(
                        msg: 'please enter your e-mail',
                        type: TextInputType.emailAddress,
                        labelText: "Email",
                        hintText: "text@email.com",
                        controller: emailController,
                        icon: Icons.email_outlined),

                    const SizedBox(
                      height: 15,
                    ),
                    //password
                    defaultTextForm(
                      onSubmitted: (value) {
                        if (formKey.currentState!.validate()) {
                          cubit.getLogin(
                            email: emailController.text,
                            password: passwdController.text,
                            phone: phoneController.text,
                            name: nameController.text,
                          );
                          print(emailController.text);
                          print(passwdController.text);
                        }
                      },
                      msg: 'please enter your password',
                      type: TextInputType.visiblePassword,
                      labelText: "password",
                      hintText: "******",
                      controller: passwdController,
                      icon: Icons.lock_outline,
                      passwd: cubit.password,
                      onTap: () {
                        cubit.changPasswordVisibility();
                      },
                      visibleIcon: cubit.suffix,
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    //Login  Button
                    ConditionalBuilder(
                      condition: state is! ShopAppLoadingRegisterStates,
                      builder: (BuildContext context) {
                        return authButton(
                            context: context,
                            authButtonText: "Sign-up",
                            onpressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.getLogin(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    email: emailController.text,
                                    password: passwdController.text);
                                print(emailController.text);
                                print(passwdController.text);
                              }
                              // Navigator.pop(context);
                            });
                      },
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'already have an account?',
                        ),
                        defaultTextButton(
                          function: () {
                            navigateAndFinish(
                              context,
                              LoginScreen(),
                            );
                          },
                          text: 'Sign in',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ))),
          );
        },
      ),
    );
  }
}
