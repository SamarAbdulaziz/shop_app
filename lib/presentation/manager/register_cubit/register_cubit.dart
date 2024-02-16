import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/data/endpoints.dart';
import 'package:shop_app/data/models/auth/register_model.dart';
import 'package:shop_app/presentation/manager/register_cubit/states.dart';
import '../../../data/data_source/remote_data_source/dio_helper.dart';

class ShopRegisterCubit extends Cubit<ShopAppRegisterStates> {
  ShopRegisterCubit() : super(InitialShopAppRegisterStates());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  RegisterModel? registerModel;

  IconData suffix = Icons.visibility_outlined;

  bool password = true;

  //// Auth data TO API
  void getRegister(
      {required String? email,
      required String? password,
      required String? name,
      required String? phone}) async {
    emit(ShopAppLoadingRegisterStates());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'email': email,
        'password': password,
        'name': name,
        'phone': phone,
      },
    ).then((value) {
      print("-------------------------------------------------------");
      registerModel = RegisterModel.fromJson(value.data);
      print("3");
      emit(ShopAppSuccessRegisterStates(registerModel!));
      print(registerModel!.data!.token);
      print("4");
    });
  }

  //To change Password Visiability
  void changPasswordVisibility() {
    password = !password;
    suffix =
        password ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopChangPasswordVisibilityRegisterStates());
  }
}
