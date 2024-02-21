import 'package:dartz/dartz.dart';
import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/data/models/auth/register_model.dart';
import 'package:shop_app/data/models/categories/categories_model.dart';
import 'package:shop_app/data/models/favorites/get_favorites_model.dart';
import 'package:shop_app/data/models/home_model/home_model.dart';
import 'package:shop_app/data/models/search/search_model.dart';
import '../../data/models/auth/login_model.dart';
import '../../data/models/favorites/change_favorites_model.dart';

abstract class BaseShopRepo {

  Future<Either<Failure, ShopLoginModel>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, RegisterModel>> register(
      {required String? email,
      required String? password,
      required String? name,
      required String? phone});

  Future<Either<Failure, HomeModel>> getHomeData();

  Future<Either<Failure, CategoriesModel>> getCategories();

  Future<Either<Failure, FavoritesModel>> getFavorites();

  Future<Either<Failure, ChangeFavoritesModel>> changeFavorites(
      {required int productId});

  Future<Either<Failure, ShopLoginModel>> getProfile();

  Future<Either<Failure, ShopLoginModel>> updateProfile(
      {required String name, required String phone, required String email});

  Future<Either<Failure, SearchModel>> search({required String? text});

}
