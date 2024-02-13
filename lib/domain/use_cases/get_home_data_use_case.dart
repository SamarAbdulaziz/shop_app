import 'package:dartz/dartz.dart';
import 'package:shop_app/data/models/home_model/home_model.dart';
import '../../core/errors/failure.dart';
import '../repository/base_shop_repo.dart';

class GetHomeUseCase {
  final BaseShopRepo baseShopRepo;

  GetHomeUseCase(this.baseShopRepo);

  Future<Either<Failure, HomeModel>> call() {
    return baseShopRepo.getHomeData();
  }
}
