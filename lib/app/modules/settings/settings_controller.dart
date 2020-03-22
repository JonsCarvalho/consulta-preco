import 'package:consulta_preco/app/shared/utils/constants.dart';
import 'package:mobx/mobx.dart';

part 'settings_controller.g.dart';

class SettingsController = _SettingsControllerBase with _$SettingsController;

abstract class _SettingsControllerBase with Store {
  
  @observable
  String ip = 'https://192.168.0.105';

  @action
  setIp(String value) {
    ip = value;
    URL_BASE = ip;
  }
}
