import 'dart:convert';

import 'package:lista_de_tarefas/models/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

const todoListKey = 'todo_List';

class TodoRepository{
 late SharedPreferences sharedPreferences;

  Future<List<Todo>> getTodoList() async {
   sharedPreferences = await SharedPreferences.getInstance();
   final String jsonString = sharedPreferences.getString(todoListKey) ??'[]';
   final List jconDecoded = json.decode(jsonString) as List;
   return jconDecoded.map((e) => Todo.fronJson(e)).toList();

 }
 
 void saveTodoList(List<Todo> todos){
   final String jsonString = json.encode(todos);
sharedPreferences.setString(todoListKey, jsonString);  
 }
 }