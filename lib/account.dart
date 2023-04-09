import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  final String account;
  const AccountScreen({Key? key, required this.account,}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String name = '';
  String age = '';
  String aid = '';
  final database = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    database.child('Account').child(widget.account).child('Name').onValue.listen((event) {
      setState(() {
        name = event.snapshot.value.toString();
      });
    });
    database.child('Account').child(widget.account).child('Age').onValue.listen((event) {
      setState(() {
        age = event.snapshot.value.toString();
      });
    });
    database.child('Account').child(widget.account).child('Visual-Aid').onValue.listen((event) {
      setState(() {
        if (event.snapshot.value.toString() == 'true'){
          aid = "Visually Challenged";
        } else {
          aid = "Smart Glass";
        }
      });
    });
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Account Details'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 25.0,),
              Row(
                children: [
                  SizedBox(width: 10.0),
                  Text('Name:', style: TextStyle(fontSize: 35.0, color: Colors.white),),

                ],
              ),
              SizedBox(width: 180.0),
              Text(name, style: TextStyle(fontSize: 20.0, color: Colors.white),),
              SizedBox(height: 20.0,),
              Row(
                children: [
                  SizedBox(width: 10.0),
                  Text('Age:', style: TextStyle(fontSize: 35.0, color: Colors.white),),

                ],
              ),
              SizedBox(width: 180.0),
              Text(age, style: TextStyle(fontSize: 20.0, color: Colors.white),),
              SizedBox(height: 25.0,),
              Row(
                children: [
                  SizedBox(width: 10.0),
                  Text('Device type:', style: TextStyle(fontSize: 35.0, color: Colors.white),),
                ],
              ),
              SizedBox(height: 15.0,),
              SizedBox(width: 180.0),
              Text(aid, style: TextStyle(fontSize: 20.0, color: Colors.white ),),
            ],
          ),
        ),
      ),
    );
  }
}