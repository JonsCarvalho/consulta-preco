import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Modular.get<HomeController>();

  _textField(inputType, onChanged, hint, label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.5),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        onChanged: onChanged,
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
        keyboardType: inputType,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(.8),
            fontSize: 20,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.white.withOpacity(.8),
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        primary: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              homeController.sendBalance();
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              homeController.fetchProducts();
            },
          ),
          // SizedBox(
          //   width: 15,
          // ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Modular.to.pushReplacementNamed(Modular.initialRoute);
            },
          )
        ],
        title: Text(
          "Consultar produto".toUpperCase(),
          style: TextStyle(fontSize: 20),
        ),
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 80),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.5),
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                onChanged: homeController.setFilter,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  labelText: 'CÓDIGO',
                  labelStyle: TextStyle(
                    color: Colors.white.withOpacity(.8),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Observer(
        builder: (_) {
          if (homeController.products.error != null) {
            return Center(
              child: RaisedButton(
                child: Text("Tente novamente!"),
                onPressed: () {
                  homeController.fetchProducts();
                },
              ),
            );
          }
          if (homeController.products.value == null) {
            return LinearProgressIndicator();
          }
          var list;
          if (homeController.filter.isEmpty) {
            list = homeController.products.value;
          } else {
            list = homeController.products.value
                .where((element) => element.id.contains(homeController.filter))
                .toList();
          }

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, int index) {
              return Column(
                children: <Widget>[
                  (index == 0 && homeController.filter.isNotEmpty)
                      ? Container(
                          color: Colors.green.withOpacity(.9),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: ListTile(
                              title: Text(
                                list[index].nome,
                                style: TextStyle(fontSize: 25),
                              ),
                              subtitle: Text(list[index].id),
                              trailing: Text(
                                list[index].preco,
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                        )
                      : Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                list[index].nome,
                                style: TextStyle(fontSize: 25),
                              ),
                              subtitle: Text(list[index].id),
                              trailing: Text(
                                list[index].preco,
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            Divider()
                          ],
                        ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
