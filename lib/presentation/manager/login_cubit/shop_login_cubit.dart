import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/domain/use_cases/login_use_case.dart';
import 'package:shop_app/presentation/manager/login_cubit/shop_login_state.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit({required this.loginUseCase}) : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);
  //late ShopLoginModel loginModel;
  final LoginUseCase loginUseCase;

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(ShopLoginLoadingState());
    var result = await loginUseCase(email: email, password: password);
    result.fold((failure) {
      emit(ShopLoginErrorState(failure.toString()));
    }, (loginModel) {
      emit(ShopLoginSuccessState(loginModel: loginModel));
    });
    // DioHelper.postData(
    //   url: LOGIN,
    //   data: {
    //     'email': email,
    //     'password': password,
    //   },
    // ).then((value) {
    //   debugPrint(value.data["message"]);
    //   loginModel = ShopLoginModel.fromJson(value.data);
    //   emit(ShopLoginSuccessState(loginModel: loginModel));
    //   // debugPrint(loginModel.status.toString());
    //   // debugPrint(loginModel.message);
    //   // debugPrint(loginModel.data!.token ?? 'no token');//
    // }).catchError((error) {
    //   debugPrint(error.toString());
    //   emit(ShopLoginErrorState(error.toString()));
    // });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ShopChangePasswordVisibilityState());
  }
}
