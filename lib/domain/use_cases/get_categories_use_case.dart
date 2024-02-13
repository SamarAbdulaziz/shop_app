import 'package:dartz/dartz.dart';
import 'package:shop_app/data/models/categories/categories_model.dart';
import '../../core/errors/failure.dart';
import '../repository/base_shop_repo.dart';

class GetCategoriesUseCase {
  final BaseShopRepo baseShopRepo;

  GetCategoriesUseCase(this.baseShopRepo);

  Future<Either<Failure, CategoriesModel>> call() {
    return baseShopRepo.getCategories();
  }
}