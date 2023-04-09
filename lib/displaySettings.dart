import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DisplayScreen extends StatefulWidget {
  final String Device;
  const DisplayScreen({Key? key, required this.Device}) : super(key: key);

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  final database = FirebaseDatabase.instance.ref('Device');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Display'),
        backgroundColor: Colors.black54,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              InkWell(
                child: Container(
                  height: 50,
                  child: Center(
                    child: Text('View Location', style: TextStyle(color: Colors.white),),
                  ),
                ),
                onTap: (){
                  database.child(widget.Device).update({
                    'Screen':'Location'
                  });
                },
              ),
              InkWell(
                child: Container(
                  height: 50,
                  child: Center(
                    child: Text('View Location', style: TextStyle(color: Colors.white),),
                  ),
                ),
                onTap: (){
                  database.child(widget.Device).update({
                    'Screen':'Location'
                  });
                },
              ),
              InkWell(
                child: Container(
                  height: 50,
                  child: Center(
                    child: Text('View Activities', style: TextStyle(color: Colors.white),),
                  ),
                ),
                onTap: (){
                  database.child(widget.Device).update({
                    'Screen':'StepCount'
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
