import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/constatnt.dart';
import 'package:shop_app/data/endpoints.dart';
import 'package:shop_app/data/models/auth/login_model.dart';
import 'package:shop_app/data/models/categories/categories_model.dart';
import 'package:shop_app/data/models/favorites/add_fav_model.dart';
import 'package:shop_app/data/models/favorites/fav_model.dart';
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
  Map<int?, bool?> fav = {};

  void getHomeData() {
    emit(ShopLoadingHomeDataStates());

    DioHelper.getData(url: HOME, token: token, query: {}).then((value) {
      // print(value.toString());
      homeModel = HomeModel.fromjson(value.data);
      //print(homeModel!.data.product[0].in_fav);
      homeModel!.data.product.forEach((element) {
        fav.addAll({element.id: element.in_fav});
      });
      print(fav.toString());

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

  FavModel? favModel;

  void ChangeFavIcon(int ProductId) {
    fav[ProductId] = !fav[ProductId]!;
    emit(ShopLoadingChangeFavDataStates());
    DioHelper.postData(
      url: Favorites,
      data: {
        'product_id': ProductId,
      },
      token: token,
    ).then((value) {
      favModel = FavModel.fromJson(value.data);
      print(value.data);
      if (!favModel!.status) {
        fav[ProductId] = !fav[ProductId]!;
      } else {
        GetHomeFavorite();
      }
      emit(ShopSuccessChangeFavDataStates(favModel!));
    });
  }

  FavoritesModel? favoritesModel;

  void GetHomeFavorite() {
    emit(ShopLoadingFavDataStates());

    DioHelper.getData(
      url: Favorites,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.Fromjson(value.data);
      print(favoritesModel!.data!.data2);

      emit(ShopSuccessFavDataStates());
    });
  }

  ShopLoginModel? UserModel;

  void GetUserData() {
    emit(ShopUserDataStates());

    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      UserModel = ShopLoginModel.fromJson(value.data);
      print(UserModel!.data!.name);

      emit(ShopSuccessUserDataStates(UserModel!));
    });
  }

// void UpdateUserData(
//     {required String name, required String phone, required String email}) {
//   emit(ShopUpdateUserDataLoadingStates());
//
//   DioHelper.putDataAPI(
//           data: {'name': name, 'phone': phone, 'email': email},
//           url: UPDATEPROFILE,
//           token: token)
//       .then((value) {
//     UserModel = ShopLoginModel.fromJson(value.data);
//     print(UserModel!.data!.name);
//
//     emit(ShopSuccessUpdateUserDataStates(UserModel!));
//   });
// }
}
