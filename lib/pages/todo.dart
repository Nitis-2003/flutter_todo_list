import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {

  final _todo = TextEditingController();
  final List<String> taskList = ["Name","Name","Name","Name","Name","Name","Name","Name","Name","Name","Name",];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
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
                  onPressed: () {},
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Expanded(
              child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(taskList[index]),
                      tileColor: Colors.amber,
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
