import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'models/product_model.dart';
import 'repositories/product_repository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ProductRepository repository;

  @observable
  String filter = '';

  @action
  setFilter(String value) {
    filter = value;
    fetchProducts();
  }

  @observable
  ObservableFuture<List<ProductModel>> products;

  _HomeControllerBase(this.repository) {
    fetchProducts();
  }

  @action
  fetchProducts() {
    products = repository.getAllProducts().asObservable();
  }

  @action
  sendBalance() async {
    BaseOptions options = new BaseOptions(
      baseUrl: "http://192.168.0.105",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    Dio dio = new Dio(options);

    Response response;

    // DioError (DioError [DioErrorType.DEFAULT]

    try {
      response = await dio.post(
        "/repository/consultaPrecoServer/?path=produtos",
        data: {"id": "1", "nome": "wendu", "quantidade": "516"},
        onSendProgress: (int sent, int total) {
          // print(response.data.toString());
        },
      );
    } on DioError catch (error) {
      if (error.response.toString() != null) {
        // do your stuff here
        print(error.message.toString());
      }
    }
    if (response.data ==
        'Esse produto não está cadastrado no banco de dados.') {
      print(response.data);
    }
  }
}
