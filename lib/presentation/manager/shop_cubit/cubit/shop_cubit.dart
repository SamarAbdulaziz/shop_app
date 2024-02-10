import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/constant.dart';
import 'package:shop_app/data/endpoints.dart';
import 'package:shop_app/data/models/auth/login_model.dart';
import 'package:shop_app/data/models/categories/categories_model.dart';
import 'package:shop_app/data/models/favorites/change_favorites_model.dart';
import 'package:shop_app/data/models/favorites/get_favorites_model.dart';
import 'package:shop_app/data/models/home_model/home_model.dart';
import 'package:shop_app/data/remote_data_source/dio_helper.dart';
import 'package:shop_app/presentation/manager/shop_cubit/cubit/states.dart';

import '../../../view/screens/cat_screen.dart';
import '../../../view/screens/fav_screen.dart';
import '../../../view/screens/product_screen.dart';
import '../../../view/screens/setting_screen.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreen = [
    const ProductScreen(),
    const CatScreen(),
    const FavScreen(),
    const SettingScreen()
  ];

  void changBottom(int index) {
    currentIndex = index;
    emit(BottomNavigationBarState());
  }

  HomeModel? homeModel;
  Map<int?, bool?> favoriteProductsMap = {};

  void getHomeData() {
    emit(ShopLoadingHomeDataStates());

    DioHelper.getData(url: HOME, token: token, query: {}).then((value) {
      // print(value.toString());
      homeModel = HomeModel.fromjson(value.data);
      //print(homeModel!.data.product[0].in_fav);
      for (var element in homeModel!.data.product) {
        favoriteProductsMap.addAll({element.id: element.in_fav});
      }
      print(favoriteProductsMap.toString());
      emit(ShopSuccessHomeDataStates());
    });
  }

  CategoriesModel? catModel;

  void getCatData() {
    emit(ShopLoadingCategoriesDataStates());

    DioHelper.getData(url: GET_CATEGRIOES, query: {}).then((value) {
      catModel = CategoriesModel.fromjson(value.data);
      print(catModel);

      emit(ShopSuccessCategoriesDataStates());
    });
  }

  ChangeFavoritesModel? favModel;

  void changeFavIcon(int productId) {
    favoriteProductsMap[productId] = !favoriteProductsMap[productId]!;
    emit(ShopLoadingChangeFavDataStates());
    DioHelper.postData(
      url: Favorites,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      favModel = ChangeFavoritesModel.fromJson(value.data);
      getHomeData();//v.imp
      // print(value.data);
      // print(favModel!.message);
      if (!favModel!.status) {
        favoriteProductsMap[productId] = !favoriteProductsMap[productId]!;
      } else {
        //if (fav[productId] == true)//if the product is changed in fav reload the data of the favorite products
        getHomeFavorite();
      }
      emit(ShopSuccessChangeFavDataStates(favModel!));
    }).catchError((e) {
      favoriteProductsMap[productId] = !favoriteProductsMap[productId]!;
      emit(ShopErrorChangeFavDataStates(e.toString()));
    });
  }

  FavoritesModel? favoritesModel;

  void getHomeFavorite() {
    emit(ShopLoadingFavDataStates());

    DioHelper.getData(
      url: Favorites,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      print(favoritesModel!.data!.data2);

      emit(ShopSuccessFavDataStates());
    }).catchError((e) {
      if (e is DioException) {
        print('*********************error******************');
        print(e.message.toString());
      }
      return e;
    });
  }

  ShopLoginModel? userModel;

  void getUserData() {
    emit(ShopLoadingUserDataStates());

    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      print(userModel!.data!.name);

      emit(ShopSuccessUserDataStates(userModel!));
    });
  }

  void updateUserData(
      {required String name, required String phone, required String email}) {
    emit(ShopUpdateUserDataLoadingStates());

    DioHelper.putData(
            data: {'name': name, 'phone': phone, 'email': email},
            url: UPDATEPROFILE,
            token: token)
        .then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
    emit(ShopSuccessUpdateUserDataStates(userModel!));
    });
  }
}
