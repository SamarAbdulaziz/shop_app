import 'package:dartz/dartz.dart';
import 'package:shop_app/data/models/auth/login_model.dart';

import '../../core/errors/failure.dart';
import '../repository/base_shop_repo.dart';

class LoginUseCase {
  final BaseShopRepo baseShopRepo;

  LoginUseCase({required this.baseShopRepo});

  Future<Either<Failure, ShopLoginModel>> call({
    required String email,
    required String password,
  }) {
    return baseShopRepo.login(
      email: email,
      password: password,
    );
  }
}
