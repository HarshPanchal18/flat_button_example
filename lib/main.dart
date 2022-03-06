import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Flat Button',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: TodoList()
    );
  }
}

class TodoList extends StatefulWidget{
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList>{
  final List<String> _todolist = <String>[];
  final TextEditingController _textFieldController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do-Task'),
        backgroundColor: Colors.green,
      ),

      body: ListView(
        children: _getItems(),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()=> _displayDialog(context),
        tooltip: 'Add Item',
        child: Icon(Icons.add_box),
        backgroundColor: Colors.teal,
      ),
    );
  }

  void _addTodoItem(String title){
    setState(() {
      _todolist.add(title);
      _getItems();
    });
    _textFieldController.clear();
  }

  void _clearItem(){
    setState(() {
      //_todolist.last;
    });
  }
  Widget _buildTodoItem(String title){
    return ListTile(
      title: Text(title),
    );
  }

  Future<Future> _displayDialog(BuildContext context) async {
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: const Text('Add a task'),
        content: TextField(
          controller: _textFieldController,
          decoration: const InputDecoration(hintText: 'Enter Task'),
        ),

        actions: <Widget>[
          FlatButton(child: const Text('Add'),
            onPressed: (){
            Navigator.of(context).pop();
            _addTodoItem(_textFieldController.text);
          },
          ),

          FlatButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: const Text('Cancel')),

          /*FlatButton(child: const Text('Clear'),
            onPressed: (){
            Navigator.of(context).pop();
            _clearItem();

          }, ),*/

        ],
      );
    });
  }
  final List<Widget> _todoWidgets=<Widget>[];

  List<Widget> _getItems(){
    _todoWidgets.clear();
    for(String title in _todolist)
      _todoWidgets.add(_buildTodoItem(title));
    return _todoWidgets;
  }
}
