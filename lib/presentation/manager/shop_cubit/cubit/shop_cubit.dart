import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/domain/use_cases/change_favorites.dart';
import 'package:shop_app/domain/use_cases/get_categories_use_case.dart';
import 'package:shop_app/domain/use_cases/get_favorites_use_case.dart';
import 'package:shop_app/domain/use_cases/get_home_data_use_case.dart';
import 'package:shop_app/domain/use_cases/get_profile_data_use_case.dart';
import 'package:shop_app/domain/use_cases/update_profile_use_case.dart';
import 'package:shop_app/presentation/manager/shop_cubit/cubit/states.dart';
import '../../../view/screens/cat_screen.dart';
import '../../../view/screens/fav_screen.dart';
import '../../../view/screens/product_screen.dart';
import '../../../view/screens/setting_screen.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit(
      this.changeFavoritesUseCase,
      this.getCategoriesUseCase,
      this.getFavoritesUseCase,
      this.getHomeUseCase,
      this.getProfileUseCase,
      this.updateProfileUseCase)
      : super(ShopInitialState());
  final ChangeFavoritesUseCase changeFavoritesUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetFavoritesUseCase getFavoritesUseCase;
  final GetHomeUseCase getHomeUseCase;
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

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

  //late HomeModel homModel;
  Map<int?, bool?> favoriteProductsMap = {};

  Future<void> getHomeData() async {
    emit(ShopLoadingHomeDataStates());
    var result = await getHomeUseCase();
    result.fold((failure) {
      emit(ShopErrorHomeDataStates(failure.message));
    }, (homeModel) {
      // homModel = homeModel;
      for (var element in homeModel.data.product) {
        favoriteProductsMap.addAll({element.id: element.in_fav});
      }
      emit(ShopSuccessHomeDataStates(homeModel));
    });

    // DioHelper.getData(
    //   url: HOME,
    //   token: token,
    // ).then((value) {
    //   // print(value.toString());
    //   homeModel = HomeModel.fromJson(value.data);
    //   //print(homeModel!.data.product[0].in_fav);
    //   for (var element in homeModel!.data.product) {
    //     favoriteProductsMap.addAll({element.id: element.in_fav});
    //   }
    //   debugPrint(favoriteProductsMap.toString());
    //   emit(ShopSuccessHomeDataStates());
    // });
  }

  //late CategoriesModel cateModel;

  Future<void> getCatData() async {
    emit(ShopLoadingCategoriesDataStates());
    var result = await getCategoriesUseCase();
    result.fold((failure) {
      emit(ShopErrorCategoriesDataStates(failure.message));
    }, (catModel) {
      //cateModel = catModel;
      emit(ShopSuccessCategoriesDataStates(categoriesModel: catModel));
    });
    // DioHelper.getData(url: GET_CATEGRIOES, query: {}).then((value) {
    //   catModel = CategoriesModel.fromJson(value.data);
    //   print(catModel);
    //
    //   emit(ShopSuccessCategoriesDataStates(categoriesModel: catModel!));
    // });
  }

  //ChangeFavoritesModel? favModel;

  Future<void> changeFavIcon(int productId) async {
    favoriteProductsMap[productId] = !favoriteProductsMap[productId]!;
    debugPrint(favoriteProductsMap.toString());

    emit(ShopLoadingChangeFavDataStates());
    var result = await changeFavoritesUseCase(productId: productId);
    result.fold((failure) {
      favoriteProductsMap[productId] = !favoriteProductsMap[productId]!;
      emit(ShopErrorChangeFavDataStates(message: failure.message));
    }, (favModel) {
      getHomeData(); //v.imp

      if (favModel.status == false) {
        //(!favModel.status)

        favoriteProductsMap[productId] = !favoriteProductsMap[productId]!;
      } else {
        //if (fav[productId] == true)//if the product is changed in fav reload the data of the favorite products
        getHomeFavorite();
      }
      emit(ShopSuccessChangeFavDataStates(favModel));
    });
    // DioHelper.postData(
    //   url: Favorites,
    //   data: {
    //     'product_id': productId,
    //   },
    //   token: token,
    // ).then((value) {
    //   favModel = ChangeFavoritesModel.fromJson(value.data);
    //   getHomeData(); //v.imp
    //   // print(value.data);
    //   // print(favModel!.message);
    //   if (!favModel!.status) {
    //     favoriteProductsMap[productId] = !favoriteProductsMap[productId]!;
    //   } else {
    //     //if (fav[productId] == true)//if the product is changed in fav reload the data of the favorite products
    //     getHomeFavorite();
    //   }
    //   emit(ShopSuccessChangeFavDataStates(favModel!));
    // }).catchError((e) {
    //   favoriteProductsMap[productId] = !favoriteProductsMap[productId]!;
    //   emit(ShopErrorChangeFavDataStates(message: e.toString()));
    // });
  }

  // FavoritesModel? favModel;

  Future<void> getHomeFavorite() async {
    emit(ShopLoadingFavDataStates());
    var result = await getFavoritesUseCase();
    result.fold((failure) {
      emit(ShopErrorFavDataStates(message: failure.message));
    }, (favoritesModel) {
      emit(ShopSuccessFavDataStates(favoritesModel: favoritesModel));
    });

    // DioHelper.getData(
    //   url: Favorites,
    //   token: token,
    // ).then((value) {
    //   favoritesModel = FavoritesModel.fromJson(value.data);
    //   print(favoritesModel!.data!.data2);
    //
    //   emit(ShopSuccessFavDataStates());
    // }).catchError((e) {
    //   if (e is DioException) {
    //     print('*********************error******************');
    //     print(e.message.toString());
    //   }
    //   return e;
    // });
  }

  //ShopLoginModel? userModel;

  Future<void> getUserData() async {
    emit(ShopLoadingUserDataStates());
    var result = await getProfileUseCase();

    result.fold((failure) {
      emit(ShopErrorUserDataStates(message: failure.message));
    }, (userModel) {
      emit(ShopSuccessUserDataStates(userModel));
    });
    // DioHelper.getData(
    //   url: PROFILE,
    //   token: token,
    // ).then((value) {
    //   userModel = ShopLoginModel.fromJson(value.data);
    //   print(userModel!.data!.name);
    //
    //   emit(ShopSuccessUserDataStates(userModel!));
    // });
  }

  Future<void> updateUserData(
      {required String name,
      required String phone,
      required String email}) async {
    emit(ShopUpdateUserDataLoadingStates());
    var result =
        await updateProfileUseCase(name: name, phone: phone, email: email);
    result.fold((failure) {
      emit(ShopErrorUpdateUserDataStates(message: failure.message));
    }, (userModel) {
      emit(ShopSuccessUpdateUserDataStates(userModel));
    });

    //   DioHelper.putData(
    //           data: {'name': name, 'phone': phone, 'email': email},
    //           url: UPDATEPROFILE,
    //           token: token)
    //       .then((value) {
    //     userModel = ShopLoginModel.fromJson(value.data);
    //     emit(ShopSuccessUpdateUserDataStates(userModel!));
    //   });
  }
}
