import 'package:gmail_login/View_Model/home_view_model.dart';
import 'package:gmail_login/View_Model/sign_in_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setLocator() {
  locator.registerLazySingleton(() => SignInViewModel());
  locator.registerLazySingleton(() => HomeViewModel());
}
