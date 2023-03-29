import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hispecs_pde2101/MainPage.dart';

import '../widgets/round_button.dart';

class UserDetails extends StatefulWidget {
  final String account;
  const UserDetails({Key? key, required this.account}) : super(key: key);
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _age;
  final database = FirebaseDatabase.instance.ref('Account');

  void _submitForm() {// Do something with the form data
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      database.child(widget.account).update({
        'Name' : _name,
        'Age' : _age,
        'Disease' : 'Null',
        'HeartRate' : {'value' : 0},
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => MainPageScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Name'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          onSaved: (value) => _name = value!,
                        ),
                        SizedBox(height:20),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Age'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Age';
                            }
                            if (value.isEmpty) {
                              return 'Please enter a valid Age';
                            }
                            return null;
                          },
                          onSaved: (value) => _age = value!,
                        ),
                        SizedBox(height:50),
                        RoundButton(
                          title: 'SignUp',
                          onTap: _submitForm,
                        ),
                      ],
                    ),
                  ),
                ]
            )
        )
    );
  }
}