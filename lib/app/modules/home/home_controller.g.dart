// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$filterAtom = Atom(name: '_HomeControllerBase.filter');

  @override
  String get filter {
    _$filterAtom.context.enforceReadPolicy(_$filterAtom);
    _$filterAtom.reportObserved();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.context.conditionallyRunInAction(() {
      super.filter = value;
      _$filterAtom.reportChanged();
    }, _$filterAtom, name: '${_$filterAtom.name}_set');
  }

  final _$productsAtom = Atom(name: '_HomeControllerBase.products');

  @override
  ObservableFuture<List<ProductModel>> get products {
    _$productsAtom.context.enforceReadPolicy(_$productsAtom);
    _$productsAtom.reportObserved();
    return super.products;
  }

  @override
  set products(ObservableFuture<List<ProductModel>> value) {
    _$productsAtom.context.conditionallyRunInAction(() {
      super.products = value;
      _$productsAtom.reportChanged();
    }, _$productsAtom, name: '${_$productsAtom.name}_set');
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setFilter(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchProducts() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.fetchProducts();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'filter: ${filter.toString()},products: ${products.toString()}';
    return '{$string}';
  }
}
