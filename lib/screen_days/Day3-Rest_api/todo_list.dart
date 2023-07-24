// import 'dart:ffi';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thirty_days/screen_days/Day3-Rest_api/add_page.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool isLoading = true;
  List items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Todos'),
        ),
        floatingActionButton: FloatingActionButton.extended(
            label: Text('Add Todo'),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddPage()));
            }),
        body: Visibility(
          child: Center(child: CircularProgressIndicator()),
          visible: isLoading,
          replacement: RefreshIndicator(
            onRefresh: fetchTodo,
            child: ListView.builder(
                itemCount: items.length,
                physics: AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                itemBuilder: (context, index) {
                  final item = items[index] as Map;

                  return ListTile(
                    subtitle: Text(item['description']),
                    leading: CircleAvatar(
                      child: Text("${index + 1}"),
                    ),
                    title: Text(item['description']),
                    trailing: PopupMenuButton(onSelected: (value) {
                      if (value == 'edit') {
                        //Open the Edit page
                      } else if (value == 'delete') {
                        //delete and remove the item
                      }
                    }, itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: Text('Edit'),
                          value: 'edit',
                        ),
                        PopupMenuItem(
                          child: Text('Delete'),
                          value: 'delete',
                        ),
                      ];
                    }),
                  );
                }),
          ),
        ));
  }

  Future<void> fetchTodo() async {
    final url = "https://api.nstack.in/v1/todos?page=1&limit=10";
    // final url = "https://jsonplaceholder.typicode.com/posts";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    // print(response.body);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['title'] as List;

      // print(result);
      setState(() {
        items = result;
      });
    } else {}
    setState(() {
      isLoading = false;
    });
  }
}
