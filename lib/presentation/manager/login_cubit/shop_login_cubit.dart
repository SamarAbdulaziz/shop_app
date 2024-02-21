import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/domain/use_cases/login_use_case.dart';
import 'package:shop_app/presentation/manager/login_cubit/shop_login_state.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit(this.loginUseCase) : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  final LoginUseCase loginUseCase;

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(ShopLoginLoadingState());
    var result = await loginUseCase(email: email, password: password);
    result.fold((failure) {
      emit(ShopLoginErrorState(failure.message.toString()));
    }, (loginModel) {
      emit(ShopLoginSuccessState(loginModel: loginModel));
    });

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
