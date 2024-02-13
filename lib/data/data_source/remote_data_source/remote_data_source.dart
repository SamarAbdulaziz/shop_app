import 'package:shop_app/core/constant.dart';
import 'package:shop_app/data/models/auth/login_model.dart';
import 'package:shop_app/data/models/categories/categories_model.dart';
import 'package:shop_app/data/models/favorites/change_favorites_model.dart';
import 'package:shop_app/data/models/favorites/get_favorites_model.dart';
import 'package:shop_app/data/models/home_model/home_model.dart';
import '../../endpoints.dart';
import '../../models/auth/register_model.dart';
import 'api_service.dart';

abstract class BaseRemoteDataSource {
  Future<ShopLoginModel> login({
    required String email,
    required String password,
  });

  Future<RegisterModel> register({
    required String? email,
    required String? password,
    required String? name,
    required String? phone,
  });

  Future<HomeModel> getHomeData();

  Future<CategoriesModel> getCatData();

  Future<FavoritesModel> getHomeFavorite();

  Future<ChangeFavoritesModel> changeFavorites({required int productId});

  Future<ShopLoginModel> getUserData();

  Future<ShopLoginModel> updateUserData({
    required String name,
    required String phone,
    required String email,
  });
}

class RemoteDataSource implements BaseRemoteDataSource {
  final ApiService apiService;

  RemoteDataSource(this.apiService);

  @override
  Future<ShopLoginModel> login({
    required String email,
    required String password,
  }) async {
    var response = await apiService.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    );
    ShopLoginModel shopLoginModel = ShopLoginModel.fromJson(response.data);
    if (shopLoginModel.status == true) {
      return shopLoginModel;
    } else {
      throw Exception(shopLoginModel.message);
    }
  }

  @override
  Future<RegisterModel> register(
      {required String? email,
      required String? password,
      required String? name,
      required String? phone}) async {
    var response = await apiService.postData(
      url: REGISTER,
      data: {
        'email': email,
        'password': password,
        'name': name,
        'phone': phone,
      },
    );
    RegisterModel registerModel = RegisterModel.fromJson(response.data);
    if (registerModel.status == true) {
      return registerModel;
    } else {
      throw Exception(registerModel.message);
    }
  }

  @override
  Future<HomeModel> getHomeData() async {
    var response = await apiService.getData(
      url: HOME,
      token: token,
    );
    HomeModel homeModel = HomeModel.fromJson(response.data);
    if (homeModel.status == true) {
      return homeModel;
    } else {
      throw Exception('homeModel error');
    }
    // DioHelper.getData(url: HOME, token: token, query: {}).then((value) {
    //   homeModel = HomeModel.fromJson(value.data);
    //   //print(homeModel!.data.product[0].in_fav);
    //   for (var element in homeModel!.data.product) {
    //     favoriteProductsMap.addAll({element.id: element.in_fav});
    //   }
    //   print(favoriteProductsMap.toString());
    // });
  }

  @override
  Future<CategoriesModel> getCatData() async {
    var response = await apiService.getData(
      url: GET_CATEGRIOES,
    );
    CategoriesModel categoriesModel = CategoriesModel.fromJson(response.data);
    if (categoriesModel.status == true) {
      return categoriesModel;
    } else {
      throw Exception('categoriesModel error');
    }

    // DioHelper.getData(url: GET_CATEGRIOES, query: {}).then((value) {
    //   catModel = CategoriesModel.fromjson(value.data);
    //   print(catModel);
    //
    //   emit(ShopSuccessCategoriesDataStates());
    // });
  }

  @override
  Future<FavoritesModel> getHomeFavorite() async {
    var response = await apiService.getData(url: Favorites, token: token);

    FavoritesModel favoritesModel = FavoritesModel.fromJson(response.data);
    if (favoritesModel.status == true) {
      return favoritesModel;
    } else {
      throw Exception(favoritesModel.message);
    }
    // DioHelper.getData(
    //   url: Favorites,
    //   token: token,
    // ).then((value) {
    //   favoritesModel = FavoritesModel.fromJson(value.data);
    //   print(favoritesModel!.data!.data2);
    //
    // });
  }

  @override
  Future<ChangeFavoritesModel> changeFavorites({required int productId}) async {
    var response = await apiService.putData(url: Favorites, data: {
      'product_id': productId,
    });
    ChangeFavoritesModel changeFavoritesModel =
        ChangeFavoritesModel.fromJson(response.data);
    if (changeFavoritesModel.status == true) {
      return changeFavoritesModel;
    } else {
      throw Exception(changeFavoritesModel.message);
    }
  }

  @override
  Future<ShopLoginModel> getUserData() async {
    var response = await apiService.getData(url: PROFILE, token: token);
    ShopLoginModel userModel = ShopLoginModel.fromJson(response.data);
    if (userModel.status == true) {
      return userModel;
    } else {
      throw Exception(userModel.message);
    }
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

  @override
  Future<ShopLoginModel> updateUserData({
    required String name,
    required String phone,
    required String email,
  }) async {
    var response = await apiService.putData(
        url: UPDATEPROFILE,
        data: {'name': name, 'phone': phone, 'email': email},
        token: token);
    ShopLoginModel userModel = ShopLoginModel.fromJson(response.data);
    if (userModel.status == true) {
      return userModel;
    } else {
      throw Exception(userModel.message);
    }
    // DioHelper.putData(
    // data: {'name': name, 'phone': phone, 'email': email},
    //     url: UPDATEPROFILE,
    //     token: token)
    //     .then((value) {
    //   userModel = ShopLoginModel.fromJson(value.data);
    // });
  }
}
