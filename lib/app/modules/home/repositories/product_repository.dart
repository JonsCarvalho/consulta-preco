import 'dart:io';

import 'package:consulta_preco/app/modules/home/models/product_model.dart';
import 'package:consulta_preco/app/shared/utils/constants.dart';
import 'package:dio/dio.dart';

class ProductRepository {
  final Dio dio;

  ProductRepository(this.dio);

  Future<List<ProductModel>> getAllProducts() async {
    // var response = await dio.get('/bins/urqre');
    // var response = await Future.wait([
    //   dio.post('/xampp-repository/JsonAPI-consulta-preco?path=produtos',
    //       data: {"id": 12, "name": "wendu"}),
    //   dio.get('/xampp-repository/JsonAPI-consulta-preco?path=produtos')
    // ]);
    // try {
    //   // Dio dio2;

    // try {
    //   await dio.post('/xampp-repository/JsonAPI-consulta-preco?path=produtos',
    //       data: {"id": 12, "nome": "wendu", "quantidade": 516},
    //       options: Options(
    //         contentType: "application/json",
    //       ));
    // } on DioError catch (error) {
    //   if (error.response.statusCode == 302) {
    //     // do your stuff here
    //   }
    // }

    var response =
        await dio.get('/repository/consultaPrecoServer?path=produtos');
    List<ProductModel> list = [];

    for (var json in (response.data)) {
      ProductModel model = ProductModel(
        id: json['id'],
        nome: json['nome'],
        preco: json['preco'],
      );
      list.add(model);
    }
    return list;
  }
}
