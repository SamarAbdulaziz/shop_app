import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/data/models/auth/register_model.dart';
import 'package:shop_app/data/models/favorites/change_favorites_model.dart';
import 'package:shop_app/data/models/favorites/get_favorites_model.dart';
import 'package:shop_app/data/models/home_model/home_model.dart';
import 'package:shop_app/data/models/search/search_model.dart';
import 'package:shop_app/domain/repository/base_shop_repo.dart';
import '../data_source/remote_data_source/remote_data_source.dart';
import '../models/auth/login_model.dart';
import '../models/categories/categories_model.dart';

class ShopRepoImpl implements BaseShopRepo {
  final BaseRemoteDataSource remoteDataSource;

  ShopRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, ShopLoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await remoteDataSource.login(
        email: email,
        password: password,
      );
      debugPrint('**************=>  on try  <=**************');
      return Right(result);
    } on Exception catch (e) {
      debugPrint('**************=>  on Server Exception  <=**************');
      if (e is DioException) {
        debugPrint('**************=>  Dio Exception  <=**************');
        return Left(ServerFailure.fromDiorError(e));
      } else {
        debugPrint('**************=>   Exception  <=**************');
        debugPrint(e.toString());
        return Left(ServerFailure.fromMessage(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> register(
      {required String? email,
      required String? password,
      required String? name,
      required String? phone}) async {
    try {
      final result = await remoteDataSource.register(
        email: email,
        password: password,
        name: name,
        phone: phone,
      );
      return Right(result);
    } on Exception catch (e) {
      if (e is DioException) {
        debugPrint('**************=>  DioException  <=**************');
        debugPrint(e.type.toString());
        debugPrint(e.message.toString());
        return Left(ServerFailure.fromDiorError(e));
      } else {
        debugPrint('**************=>   Exception  <=**************');
        debugPrint(e.toString());
        return Left(ServerFailure.fromMessage(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CategoriesModel>> getCategories() async {
    try {
      final result = await remoteDataSource.getCatData();
      return Right(result);
    } on Exception catch (e) {
      debugPrint('**************=>  on Server Exception  <=**************');
      if (e is DioException) {
        debugPrint('**************=>  Dio Exception  <=**************');
        return Left(ServerFailure.fromDiorError(e));
      } else {
        debugPrint('**************=>   Exception  <=**************');
        debugPrint(e.toString());
        return Left(ServerFailure.fromMessage(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, FavoritesModel>> getFavorites() async {
    try {
      final result = await remoteDataSource.getHomeFavorite();
      return Right(result);
    } on Exception catch (e) {
      debugPrint('**************=>  on Server Exception  <=**************');
      if (e is DioException) {
        debugPrint('**************=>  Dio Exception  <=**************');
        return Left(ServerFailure.fromDiorError(e));
      } else {
        debugPrint('**************=>   Exception  <=**************');
        debugPrint(e.toString());
        return Left(ServerFailure.fromMessage(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, HomeModel>> getHomeData() async {
    try {
      final result = await remoteDataSource.getHomeData();

      return Right(result);
    } on Exception catch (e) {
      debugPrint('**************=>  on Server Exception  <=**************');
      if (e is DioException) {
        debugPrint('**************=>  Dio Exception  <=**************');
        return Left(ServerFailure.fromDiorError(e));
      } else {
        debugPrint('**************=>   Exception  <=**************');
        debugPrint(e.toString());
        return Left(ServerFailure.fromMessage(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ShopLoginModel>> getProfile() async {
    try {
      final result = await remoteDataSource.getUserData();

      return Right(result);
    } on Exception catch (e) {
      debugPrint('**************=>  on Server Exception  <=**************');
      if (e is DioException) {
        debugPrint('**************=>  Dio Exception  <=**************');
        return Left(ServerFailure.fromDiorError(e));
      } else {
        debugPrint('**************=>   Exception  <=**************');
        debugPrint(e.toString());
        return Left(ServerFailure.fromMessage(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ChangeFavoritesModel>> changeFavorites(
      {required int productId}) async {
    try {
      final result =
          await remoteDataSource.changeFavorites(productId: productId);

      return Right(result);
    } on Exception catch (e) {
      debugPrint('**************=>  on Server Exception  <=**************');
      if (e is DioException) {
        debugPrint('**************=>  Dio Exception  <=**************');
        return Left(ServerFailure.fromDiorError(e));
      } else {
        debugPrint('**************=>   Exception  <=**************');
        debugPrint(e.toString());
        return Left(ServerFailure.fromMessage(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ShopLoginModel>> updateProfile(
      {required String name,
      required String phone,
      required String email}) async {
    try {
      final result = await remoteDataSource.updateUserData(
          name: name, phone: phone, email: email);
      return Right(result);
    } on Exception catch (e) {
      debugPrint('**************=>  on Server Exception  <=**************');
      if (e is DioException) {
        debugPrint('**************=>  Dio Exception  <=**************');
        return Left(ServerFailure.fromDiorError(e));
      } else {
        debugPrint('**************=>   Exception  <=**************');
        debugPrint(e.toString());
        return Left(ServerFailure.fromMessage(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, SearchModel>> search({required String? text}) async {
    try {
      final result = await remoteDataSource.search(text: text);
      return Right(result);
    } on Exception catch (e) {
      debugPrint('**************=>  on Server Exception  <=**************');
      if (e is DioException) {
        debugPrint('**************=>  Dio Exception  <=**************');
        return Left(ServerFailure.fromDiorError(e));
      } else {
        debugPrint('**************=>   Exception  <=**************');
        debugPrint(e.toString());
        return Left(ServerFailure.fromMessage(e.toString()));
      }
    }
  }
}
