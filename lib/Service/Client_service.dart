import 'package:dio/dio.dart';
import 'package:flutter_application_1/Models/Todo_model.dart';

class Client_service {
  String URL = "https://jsonplaceholder.typicode.com/todos";
  Future<List<TodoModel>> getClients() async {
    List<TodoModel> clientList = [];

    final response = await Dio().get(URL);
    var data = response.data;
    data.forEach((Element) {
      TodoModel client = TodoModel.fromJson(Element);
      clientList.add(client);
    });
    return clientList;
  }
}
