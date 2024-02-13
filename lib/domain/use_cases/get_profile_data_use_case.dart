import 'package:dartz/dartz.dart';
import 'package:shop_app/data/models/auth/login_model.dart';
import '../../core/errors/failure.dart';
import '../repository/base_shop_repo.dart';

class GetProfileUseCase {
  final BaseShopRepo baseShopRepo;

  GetProfileUseCase({required this.baseShopRepo});

  Future<Either<Failure, ShopLoginModel>> call() {
    return baseShopRepo.getProfile();
  }
}
