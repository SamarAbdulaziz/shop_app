import 'package:dartz/dartz.dart';
import 'package:shop_app/data/models/search/search_model.dart';
import '../../core/errors/failure.dart';
import '../repository/base_shop_repo.dart';

class SearchUseCase {
  final BaseShopRepo baseShopRepo;

  SearchUseCase(this.baseShopRepo);

  Future<Either<Failure, SearchModel>> call({
    required String? text,
  }) {
    return baseShopRepo.search(text: text);
  }
}
