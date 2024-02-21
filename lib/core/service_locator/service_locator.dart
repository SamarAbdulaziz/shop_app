import 'package:get_it/get_it.dart';
import 'package:shop_app/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:shop_app/data/repository/shop_repo_impl.dart';
import 'package:shop_app/domain/repository/base_shop_repo.dart';
import 'package:shop_app/domain/use_cases/change_favorites.dart';
import 'package:shop_app/domain/use_cases/get_categories_use_case.dart';
import 'package:shop_app/domain/use_cases/get_favorites_use_case.dart';
import 'package:shop_app/domain/use_cases/get_home_data_use_case.dart';
import 'package:shop_app/domain/use_cases/get_profile_data_use_case.dart';
import 'package:shop_app/domain/use_cases/login_use_case.dart';
import 'package:shop_app/domain/use_cases/register_use_case.dart';
import 'package:shop_app/domain/use_cases/search_use_case.dart';
import 'package:shop_app/domain/use_cases/update_profile_use_case.dart';
import 'package:shop_app/presentation/manager/login_cubit/shop_login_cubit.dart';
import 'package:shop_app/presentation/manager/register_cubit/register_cubit.dart';
import 'package:shop_app/presentation/manager/search_cubit/search_cubit.dart';
import 'package:shop_app/presentation/manager/shop_cubit/cubit/shop_cubit.dart';

import '../../data/data_source/remote_data_source/api_service.dart';

var sl = GetIt.instance;

class ServiceLocator {
  void init() {
    ///Api Service
    sl.registerLazySingleton(() => ApiService());

    ///Remote Data Source
    sl.registerLazySingleton<BaseRemoteDataSource>(
        () => RemoteDataSource(sl()));

    ///repos
    sl.registerLazySingleton<BaseShopRepo>(() => ShopRepoImpl(sl()));

    ///useCases
    sl.registerLazySingleton<ChangeFavoritesUseCase>(
        () => ChangeFavoritesUseCase(sl()));
    sl.registerLazySingleton<GetCategoriesUseCase>(
        () => GetCategoriesUseCase(sl()));
    sl.registerLazySingleton<GetFavoritesUseCase>(
        () => GetFavoritesUseCase(sl()));
    sl.registerLazySingleton<GetHomeUseCase>(() => GetHomeUseCase(sl()));
    sl.registerLazySingleton<GetProfileUseCase>(() => GetProfileUseCase(sl()));
    sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));

    sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));
    sl.registerLazySingleton<SearchUseCase>(() => SearchUseCase(sl()));
    sl.registerLazySingleton<UpdateProfileUseCase>(
        () => UpdateProfileUseCase(sl()));

    ///cubits
    sl.registerFactory(() => ShopLoginCubit(sl()));
    sl.registerFactory(() => ShopRegisterCubit(sl()));
    sl.registerFactory(() => SearchCubit(sl()));
    sl.registerFactory(() => ShopCubit(sl(), sl(), sl(), sl(), sl(), sl()));
  }
}
