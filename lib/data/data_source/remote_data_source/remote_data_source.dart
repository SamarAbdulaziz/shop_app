import 'package:flutter/material.dart';
import 'package:shop_app/core/constant.dart';
import 'package:shop_app/data/models/auth/login_model.dart';
import 'package:shop_app/data/models/categories/categories_model.dart';
import 'package:shop_app/data/models/favorites/change_favorites_model.dart';
import 'package:shop_app/data/models/favorites/get_favorites_model.dart';
import 'package:shop_app/data/models/home_model/home_model.dart';
import '../../endpoints.dart';
import '../../models/auth/register_model.dart';
import '../../models/search/search_model.dart';
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

  Future<SearchModel> search({required String? text});
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
      debugPrint(
          '**************=>   remote data source error  <=**************');
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
  }

  @override
  Future<ChangeFavoritesModel> changeFavorites({required int productId}) async {
    var response = await apiService.postData(url: Favorites, data: {
      'product_id': productId,
    },token: token
    );
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
  }

  @override
  Future<SearchModel> search({required String? text}) async {
    var response = await apiService.postData(
      url: SEARCH,
      data: {
        'text': text,
      },
      token: token,
    );
    SearchModel searchModel = SearchModel.fromJson(response.data);
    if (searchModel.status == true) {
      return searchModel;
    } else {
      throw Exception(searchModel.message);
    }
  }
}
