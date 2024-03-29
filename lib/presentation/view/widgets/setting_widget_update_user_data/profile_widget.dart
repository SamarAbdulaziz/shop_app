import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/components.dart';
import 'package:shop_app/core/constant.dart';
import 'package:shop_app/presentation/manager/shop_cubit/cubit/shop_cubit.dart';
import 'package:shop_app/presentation/manager/shop_cubit/cubit/states.dart';
import 'package:shop_app/presentation/view/widgets/custom_widget/custom_auth_button.dart';
import 'package:shop_app/presentation/view/widgets/custom_widget/custom_text_form_field_widget.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({super.key});

  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is ShopSuccessUpdateUserDataStates) {
          showToast(
            msg: state.model.message!,
            state: ToastStates.success,
          );
          //navigateAndFinish(context, const HomeScreen());//leads to the same screen
        }
        if (state is ShopErrorUpdateUserDataStates) {
          showToast(
            msg: state.error.toString(),
            state: ToastStates.error,
          );
        }
      },
      builder: (context, state) {
        var model = ShopCubit.get(context).userModel;
        token = model!.data!.token;
        nameController.text = model.data!.name!;
        emailController.text = model.data!.email!;
        phoneController.text = model.data!.phone!;
        ShopCubit cubit = ShopCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.userModel != null,
          fallback: (BuildContext context) =>
              const Center(child: Text("Please Refresh the application")),
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    if (state is ShopUpdateUserDataLoadingStates)
                      const LinearProgressIndicator(),
                    const SizedBox(
                      height: 20,
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
                    //login
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
                    //phone
                    defaultTextForm(
                        msg: 'please enter your phone',
                        type: TextInputType.phone,
                        labelText: "phone",
                        hintText: "01xxxxxxxxx",
                        controller: phoneController,
                        icon: Icons.phone),
                    const SizedBox(
                      height: 20,
                    ),
                    authButton(
                      context: context,
                      authButtonText: "Update Data",
                      onpressed: () {
                        if (formKey.currentState!.validate()) {
                          cubit.updateUserData(
                            name: nameController.text,
                            phone: phoneController.text,
                            email: emailController.text,
                          );
                          print(emailController.text);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    authButton(
                      context: context,
                      authButtonText: "Sign out",
                      onpressed: () {
                        singOut(context);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
