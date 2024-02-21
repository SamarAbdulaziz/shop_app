import 'package:shop_app/data/models/auth/login_model.dart';
import 'package:shop_app/data/models/favorites/change_favorites_model.dart';
import 'package:shop_app/data/models/favorites/get_favorites_model.dart';
import 'package:shop_app/data/models/home_model/home_model.dart';

import '../../../../data/models/categories/categories_model.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class BottomNavigationBarState extends ShopStates {}

class ShopLoadingHomeDataStates extends ShopStates {}

class ShopSuccessHomeDataStates extends ShopStates {
  final HomeModel homeModel;

  ShopSuccessHomeDataStates(this.homeModel);
}

class ShopErrorHomeDataStates extends ShopStates {
  final String error;

  ShopErrorHomeDataStates(this.error);
}
//==================================================================

class ShopLoadingCategoriesDataStates extends ShopStates {}

class ShopSuccessCategoriesDataStates extends ShopStates {
  final CategoriesModel categoriesModel;

  ShopSuccessCategoriesDataStates({required this.categoriesModel});
}

class ShopErrorCategoriesDataStates extends ShopStates {
  final String error;

  ShopErrorCategoriesDataStates(this.error);
}

//==================================================================

class ShopLoadingFavDataStates extends ShopStates {}

class ShopSuccessFavDataStates extends ShopStates {
  final FavoritesModel favoritesModel;

  ShopSuccessFavDataStates({required this.favoritesModel});
}

class ShopErrorFavDataStates extends ShopStates {
  final String message;

  ShopErrorFavDataStates({required this.message});
}

//==================================================================
class ShopLoadingChangeFavDataStates extends ShopStates {}

class ShopSuccessChangeFavDataStates extends ShopStates {
  final ChangeFavoritesModel model;

  ShopSuccessChangeFavDataStates(this.model);
}

class ShopErrorChangeFavDataStates extends ShopStates {
  final String message;

  ShopErrorChangeFavDataStates({required this.message});
}

//==================================================================
class ShopLoadingUserDataStates extends ShopStates {}

class ShopSuccessUserDataStates extends ShopStates {
  final ShopLoginModel model;

  ShopSuccessUserDataStates(this.model);
}

class ShopErrorUserDataStates extends ShopStates {
  final String message;

  ShopErrorUserDataStates({required this.message});
}

//==================================================================
class ShopUpdateUserDataLoadingStates extends ShopStates {}

class ShopSuccessUpdateUserDataStates extends ShopStates {
  final ShopLoginModel model;

  ShopSuccessUpdateUserDataStates(this.model);
}

class ShopErrorUpdateUserDataStates extends ShopStates {
  final String message;

  ShopErrorUpdateUserDataStates({required this.message});
}
