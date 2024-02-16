import 'package:dartz/dartz.dart';
import 'package:shop_app/domain/repository/base_shop_repo.dart';
import '../../core/errors/failure.dart';
import '../../data/models/favorites/change_favorites_model.dart';

class ChangeFavoritesUseCase {
  final BaseShopRepo baseShopRepo;

  ChangeFavoritesUseCase(this.baseShopRepo);

  Future<Either<Failure, ChangeFavoritesModel>> call({required int productId}) {
    return baseShopRepo.changeFavorites(productId: productId);
  }
}
