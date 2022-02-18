import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:lista_de_tarefas/models/todo.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({Key? key,
   required this.todo,
   required this.onDelete,
  }) : super(key: key);

  final Todo todo;
  final Function(Todo) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Slidable(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.grey[200],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                DateFormat('dd/MMM/yyyy - HH:mm').format(todo.dateTime),
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                todo.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.20,
          children: [
            SlidableAction(
              label: 'Deletar',
              backgroundColor: Colors.red,
              icon: Icons.delete,
              onPressed: (context) {onDelete(todo);
              },
            ),
          ],
        ),
      ),
    );
  }
}
