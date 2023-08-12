import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/Models/Todo_model.dart';
import 'package:flutter_application_1/Service/Client_service.dart';

class Body2 extends StatefulWidget {
  @override
  State<Body2> createState() => _Body2State();
}

class _Body2State extends State<Body2> {
  List<TodoModel> Clients = [];
  bool isLoading = true;
  getMyClients() async {
    Clients = await Client_service().getClients();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getMyClients();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: Clients.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(Clients[index].title ?? "--"),
                subtitle: Text("COMPLETED: " +
                    Clients[index].completed.toString() +
                    '\n' +
                    "ID: " +
                    Clients[index].id.toString()),
                trailing: Icon(Icons.person),
                leading: Text("${index + 1}"),
              );
            },
          );
  }
}
