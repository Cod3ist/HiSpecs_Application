import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],

      appBar: AppBar( /// AppBar for the application
        title: Text('WELCOME'),
        centerTitle: true,
        toolbarHeight: 70.0,
        backgroundColor: Colors.grey[850],
      ),
    );
  }
}
