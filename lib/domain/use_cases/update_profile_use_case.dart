import 'package:dartz/dartz.dart';
import 'package:shop_app/data/models/auth/login_model.dart';

import '../../core/errors/failure.dart';
import '../repository/base_shop_repo.dart';

class UpdateProfileUseCase {
  final BaseShopRepo baseShopRepo;

  UpdateProfileUseCase(this.baseShopRepo);

  Future<Either<Failure, ShopLoginModel>> call({
    required String email,
    required String name,
    required String phone,
  }) {
    return baseShopRepo.updateProfile(
      name: name,
      phone: phone,
      email: email,
    );
  }
}
