// part of 'shop_login_cubit.dart';
//
// @immutable
// abstract class ShopLoginState {}
//
// class ShopLoginInitial extends ShopLoginState {}

import 'package:shop_app/data/models/auth/login_model.dart';

abstract class ShopLoginStates {}

class ShopLoginInitialState extends ShopLoginStates {}

class ShopLoginLoadingState extends ShopLoginStates {}

class ShopLoginSuccessState extends ShopLoginStates {
  final ShopLoginModel loginModel;

  ShopLoginSuccessState({required this.loginModel});
}

class ShopLoginErrorState extends ShopLoginStates {
  final String error;

  ShopLoginErrorState(this.error);
}

class ShopChangePasswordVisibilityState extends ShopLoginStates {}
