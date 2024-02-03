
import 'package:shop_app/data/models/auth/login_model.dart';

import '../../../data/models/auth/register_model.dart';

abstract class ShopAppRegisterStates {}

class InitialShopAppRegisterStates extends ShopAppRegisterStates {}

class ShopAppLoadingRegisterStates extends ShopAppRegisterStates {}

class ShopAppSuccessRegisterStates extends ShopAppRegisterStates {
  final RegisterModel registerModel;

  ShopAppSuccessRegisterStates(this.registerModel);
}

class ShopAppErrorRegisterStates extends ShopAppRegisterStates {
  final String error;

  ShopAppErrorRegisterStates(this.error);
}

class ShopChangPasswordVisibilityRegisterStates extends ShopAppRegisterStates {}
