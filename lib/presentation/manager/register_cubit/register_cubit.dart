import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/domain/use_cases/register_use_case.dart';
import 'package:shop_app/presentation/manager/register_cubit/states.dart';

class ShopRegisterCubit extends Cubit<ShopAppRegisterStates> {
  ShopRegisterCubit(this.registerUseCase)
      : super(InitialShopAppRegisterStates());
  final RegisterUseCase registerUseCase;

  static ShopRegisterCubit get(context) => BlocProvider.of(context);
  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwdController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  //RegisterModel? registerModel;

  IconData suffix = Icons.visibility_outlined;

  bool password = true;

  //// Auth data TO API
  Future<void> getRegister(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    emit(ShopAppLoadingRegisterStates());

    var result = await registerUseCase(
        email: email, password: password, name: name, phone: phone);

    result.fold((failure) {
      emit(ShopAppErrorRegisterStates(failure.message));
    }, (registerModel) {
      emit(ShopAppSuccessRegisterStates(registerModel));
    });

    // DioHelper.postData(
    //   url: REGISTER,
    //   data: {
    //     'email': email,
    //     'password': password,
    //     'name': name,
    //     'phone': phone,
    //   },
    // ).then((value) {
    //   print("-------------------------------------------------------");
    //   registerModel = RegisterModel.fromJson(value.data);
    //   print("3");
    //   emit(ShopAppSuccessRegisterStates(registerModel!));
    //   print(registerModel!.data!.token);
    // });
  }

  //To change Password Visiability
  void changPasswordVisibility() {
    password = !password;
    suffix =
        password ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopChangPasswordVisibilityRegisterStates());
  }
}
