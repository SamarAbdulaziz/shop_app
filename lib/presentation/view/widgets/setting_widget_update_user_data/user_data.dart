// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:copy/controller/service/componans.dart';
// import 'package:copy/view/widget/custom_widget/custom_auth_button.dart';
// import 'package:copy/view/widget/custom_widget/custom_textformfield_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../controller/service/cash_helper.dart';
// import '../../../controller/service/constant.dart';
// import '../../../controller/shop/cubit/cubit.dart';
// import '../../../controller/shop/cubit/states.dart';
// import '../../screen/login/login_screen.dart';
//
// Widget UserData(context) {
//   var formKey = GlobalKey<FormState>();
//   var emailcontroller = TextEditingController();
//   var namecontroller = TextEditingController();
//   var phonecontroller = TextEditingController();
//   return BlocConsumer<ShopCubit, ShopStates>(
//     listener: (BuildContext context,  state) {},
//     builder: (BuildContext context,  state) {
//
//       var model = ShopCubit.get(context).UserModel;
//       token=model!.data!.token;
//       namecontroller.text = model.data!.name!;
//       emailcontroller.text = model.data!.email!;
//       phonecontroller.text = model.data!.phone!;
//       ShopCubit getData = ShopCubit.get(context);
//       return ConditionalBuilder(
//         condition: getData.UserModel != null,
//         fallback: (BuildContext context) =>  const Center(child: Text("Please Refresh the applecation")),
//         builder: (BuildContext context) {
//           return  Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Form(
//               key: formKey,
//               child: Column(
//                 children: [
//                   if(state is ShopUpdateUserDataLoadingStates) const LinearProgressIndicator(),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   //name
//                   defaultTextForm(
//                       msg: 'please enter your Name',
//                       type: TextInputType.name,
//                       labelText: "Name",
//                       hintText: "Test",
//                       controller: namecontroller,
//                       icon: Icons.person),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   //login
//                   defaultTextForm(
//                       msg: 'please enter your e-mail',
//                       type: TextInputType.emailAddress,
//                       labelText: "Email",
//                       hintText: "text@email.com",
//                       controller: emailcontroller,
//                       icon: Icons.email_outlined),
//
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   //phone
//                   defaultTextForm(
//                       msg: 'please enter your phone',
//                       type: TextInputType.phone,
//                       labelText: "phone",
//                       hintText: "01xxxxxxxxx",
//                       controller: phonecontroller,
//                       icon: Icons.phone),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   authButton(
//                     context: context,
//                     authButtonText: "Update Data",
//                     onpressed: () {
//                       if (formKey.currentState!.validate()) {
//                         getData.UpdateUserData(
//                             name: namecontroller.text,
//                             phone: phonecontroller.text,
//                             email: emailcontroller.text,
//                            );
//                         print(emailcontroller.text);
//
//                       }
//                     },
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//
//                   authButton(
//                     context: context,
//                     authButtonText: "Sign out",
//                     onpressed: () {
//                       CachHelper.clearData(key: 'token').then(
//                           (value) => navigatReplace(context, LoginScreen()));
//                     },
//                   ),
//
//
//
//                 ],
//               ),
//             ),
//           );
//         },
//       );
//     },
//   );
// }
