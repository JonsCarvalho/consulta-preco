// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsController on _SettingsControllerBase, Store {
  final _$ipAtom = Atom(name: '_SettingsControllerBase.ip');

  @override
  String get ip {
    _$ipAtom.context.enforceReadPolicy(_$ipAtom);
    _$ipAtom.reportObserved();
    return super.ip;
  }

  @override
  set ip(String value) {
    _$ipAtom.context.conditionallyRunInAction(() {
      super.ip = value;
      _$ipAtom.reportChanged();
    }, _$ipAtom, name: '${_$ipAtom.name}_set');
  }

  final _$_SettingsControllerBaseActionController =
      ActionController(name: '_SettingsControllerBase');

  @override
  dynamic setIp(String value) {
    final _$actionInfo =
        _$_SettingsControllerBaseActionController.startAction();
    try {
      return super.setIp(value);
    } finally {
      _$_SettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'ip: ${ip.toString()}';
    return '{$string}';
  }
}
