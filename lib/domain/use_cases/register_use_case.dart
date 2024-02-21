import 'package:dartz/dartz.dart';
import '../../core/errors/failure.dart';
import '../../data/models/auth/register_model.dart';
import '../repository/base_shop_repo.dart';

class RegisterUseCase {
  final BaseShopRepo baseShopRepo;

  RegisterUseCase(this.baseShopRepo);

  Future<Either<Failure, RegisterModel>> call({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    return baseShopRepo.register(
      email: email,
      password: password,
      name: name,
      phone: phone,
    );
  }
}
