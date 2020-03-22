import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'settings_controller.dart';

class SettingsPage extends StatefulWidget {
  final String title;
  const SettingsPage({Key key, this.title = "Settings"}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState
    extends ModularState<SettingsPage, SettingsController> {
  final settingsController = Modular.get<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        primary: false,
        title: Text(
          "Insira o IP".toUpperCase(),
          style: TextStyle(fontSize: 25),
        ),
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 80),
          child: Observer(builder: (_) {
            return Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.5),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(
                        onChanged: settingsController.setIp,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          labelText: 'http://192.168.0.105',
                          hintText: settingsController.ip,
                          labelStyle: TextStyle(
                            color: Colors.white.withOpacity(.8),
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: FlatButton(
                          onPressed: () {
                            Modular.to.pushReplacementNamed('/home');
                          },
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            child: Text(
                              "OK".toUpperCase(),
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
      body: Container(),
    );
  }
}
