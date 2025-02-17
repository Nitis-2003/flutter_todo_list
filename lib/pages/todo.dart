import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final _todo = TextEditingController();
  final List<String> taskList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Padding(padding: EdgeInsets.all(5)),
                Expanded(
                  child: TextField(
                    controller: _todo,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Add task',
                    ),
                  ),
                ),
                SizedBox(width: 5),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(50, 60),
                    shape: CircleBorder(),
                  ),
                  onPressed: () {
                    setState(() {
                      taskList.add(_todo.text);
                      _todo.clear();
                    });
                  },
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(taskList[index]),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            taskList.removeAt(index);
                          });
                          },
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                      tileColor: Colors.lightBlue[100],
                      textColor: Colors.black,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
