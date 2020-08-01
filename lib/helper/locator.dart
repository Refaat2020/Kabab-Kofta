
import 'package:food/state/foodMob.dart';
import 'package:food/state/user_mob.dart';
import 'package:get_it/get_it.dart';


GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => FoodStore());
  locator.registerLazySingleton(() => UserStore());

}