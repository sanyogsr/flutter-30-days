import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Your Todo"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: "Title"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(hintText: "description"),
            minLines: 5,
            maxLines: 8,
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: submitTodo, child: const Text("Submit"))
        ],
      ),
    );
  }

  Future<void> submitTodo() async {
    // get the data
    final title = titleController.text;
    final description = descriptionController.text;

    final body = {
      "title": title,
      "description": description,
      "id_completed": false
    };

    // submit the data

    final url = "https://api.nstack.in/v1/todos";
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        body: jsonEncode(body), headers: {"Content-Type": "application/json"});
    // show the success message

    if (response.statusCode == 201) {
      titleController.text = "";
      descriptionController.text = "";
      print("Creation Success");
      showSuccessMessage('Created Successfully');
    } else {
      print("Creation Failed");
      showErrorMessage('Error');
    }
  }

  void showSuccessMessage(String message) {
    final showSnackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(showSnackBar);
  }

  void showErrorMessage(String message) {
    final showSnackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      showSnackBar,
    );
  }
}
