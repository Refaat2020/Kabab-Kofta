// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foodMob.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FoodStore on FoodMob, Store {
  final _$_foodsAtom = Atom(name: 'FoodMob._foods');

  @override
  List<FoodData> get _foods {
    _$_foodsAtom.reportRead();
    return super._foods;
  }

  @override
  set _foods(List<FoodData> value) {
    _$_foodsAtom.reportWrite(value, super._foods, () {
      super._foods = value;
    });
  }

  final _$_isLoadingAtom = Atom(name: 'FoodMob._isLoading');

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  final _$addFoodAsyncAction = AsyncAction('FoodMob.addFood');

  @override
  Future<bool> addFood(FoodData foodData, BuildContext context) {
    return _$addFoodAsyncAction.run(() => super.addFood(foodData, context));
  }

  final _$fetchFoodsAsyncAction = AsyncAction('FoodMob.fetchFoods');

  @override
  Future<dynamic> fetchFoods() {
    return _$fetchFoodsAsyncAction.run(() => super.fetchFoods());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
