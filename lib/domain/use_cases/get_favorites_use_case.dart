import 'package:dartz/dartz.dart';
import 'package:shop_app/data/models/favorites/get_favorites_model.dart';
import '../../core/errors/failure.dart';
import '../repository/base_shop_repo.dart';

class GetFavoritesUseCase {
  final BaseShopRepo baseShopRepo;

  GetFavoritesUseCase(this.baseShopRepo);

  Future<Either<Failure, FavoritesModel>> call() {
    return baseShopRepo.getFavorites();
  }
}
