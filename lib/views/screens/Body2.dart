import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/Models/Todo_model.dart';
import 'package:flutter_application_1/Service/Task_service.dart';
import 'package:flutter_application_1/views/cubit/todo_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body2 extends StatefulWidget {
  @override
  State<Body2> createState() => _Body2State();
}

class _Body2State extends State<Body2> {
  /* List<TodoModel> Tasks = [];
  getMyTasks() async {
    Tasks = await Task_service().getTasks();
  }*/

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: BlocConsumer<TodoCubit, TodoState>(
        builder: (context, State) {
          if (State is TaskLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (State is TaskError) {
            return Center(
              child: Text("Error"),
            );
          }

          return ListView.builder(
            itemCount: context.watch<TodoCubit>().Tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title:
                    Text(context.watch<TodoCubit>().Tasks[index].title ?? "--"),
                subtitle: Text("COMPLETED: " +
                    context
                        .watch<TodoCubit>()
                        .Tasks[index]
                        .completed
                        .toString() +
                    '\n' +
                    "ID: " +
                    context.watch<TodoCubit>().Tasks[index].id.toString()),
                trailing: Icon(Icons.person),
                leading: Text("${index + 1}"),
              );
            },
          );
        },
        listener: (context, State) {},
      ),
    );
  }
}
