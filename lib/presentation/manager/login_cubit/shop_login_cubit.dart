import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/data/models/auth/login_model.dart';
import 'package:shop_app/data/remote_data_source/dio_helper.dart';
import 'package:shop_app/presentation/manager/login_cubit/shop_login_state.dart';
import '../../../data/endpoints.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);
  late ShopLoginModel loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(ShopLoginLoadingState());

    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      debugPrint(value.data["message"]);
      loginModel = ShopLoginModel.fromJson(value.data);
      emit(ShopLoginSuccessState(loginModel: loginModel));
      // debugPrint(loginModel.status.toString());
      // debugPrint(loginModel.message);
      // debugPrint(loginModel.data!.token ?? 'no token');//
    }).catchError((error) {
      debugPrint(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  // void userLogin({
  //   required String email,
  //   required String password,
  // }) {
  //   emit(ShopLoginLoadingState());
  //   DioHelper?.postData(
  //     url: LOGIN,
  //     data: {
  //       'email': email,
  //       'password': password,
  //     },
  //   ).then((value) {
  //     debugPrint(value.data);
  //     emit(ShopLoginSuccessState());
  //     // emit(ShopAppScuccessStates(ShopLoginModel.fromjson(value.data)));
  //     // PostLogin = ShopLoginModel.fromjson(value.data);
  //     // print(PostLogin?.message);
  //   }).catchError((error) {
  //     debugPrint(error.toString());
  //     emit(ShopLoginErrorState(error.toString()));
  //
  //     // emit(ShopAppErrorStates(error.toString()));
  //     // print(error.toString());
  //   });
  // }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ShopChangePasswordVisibilityState());
  }
}
