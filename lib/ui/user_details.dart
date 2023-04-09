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
  bool isSwitched = false;
  late String _name;
  late String _age;
  final database = FirebaseDatabase(databaseURL: "https://hispecs-f6b64-default-rtdb.asia-southeast1.firebasedatabase.app/").ref('Account').ref;

  void _submitForm() {// Do something with the form data
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      database.child(widget.account).update({
        'Name' : _name,
        'Age' : _age,
        'Activities' : {'EnergySpent': "value", 'StepCount':"value"},
        'Location' : {'latitude' : '0', 'longitude':'0'},
        'Visual-Aid' : isSwitched.toString(),
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => MainPageScreen(account: widget.account, DeviceConnected: 'null',)));
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
                        SizedBox(height:20,),
                        Row(
                          children: [
                            Text('Visual-Aid'),
                            SizedBox(width: 20,),
                            Switch(
                                value: isSwitched,
                                onChanged: (value){
                                  setState(() {
                                    isSwitched = true;
                                  });
                                }
                            )
                          ],
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