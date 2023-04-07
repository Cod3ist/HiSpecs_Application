import 'package:flutter/material.dart';
import 'package:hispecs_pde2101/widgets/account_button.dart';
import 'package:hispecs_pde2101/widgets/features_button.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],

      appBar: AppBar( /// AppBar for the application
        leading: AccountButton(),
        title: Text('WELCOME'),
        centerTitle: true,
        toolbarHeight: 70.0,
        backgroundColor: Colors.grey[850],
      ),

      body: SingleChildScrollView(
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100.0),
                Row(
                    children: <Widget>[
                      SizedBox(width: 20.0),
                      BoxButton(title: 'LOCATION', image: 'images/location.jpg', onTap: () {  },), ///Placing the Location Widget
                      SizedBox(width: 10.0),
                      BoxButton(title: 'ACTIVITIES', image: 'images/activities.jpg', onTap: (){  })///Placing the Activities Widget
                    ]
                ),
                SizedBox(height: 20.0),
                Row(
                    children: <Widget>[
                      SizedBox(width: 20.0),
                      BoxButton(title: '', image: 'images/accessibilities.jpg', onTap: () {  },), ///Placing the Location Widget
                      SizedBox(width: 10.0),
                      BoxButton(title: 'DISPLAY SETTINGS', image: 'images/display_settings.jpg', onTap: (){  })///Placing the Activities Widget
                    ]
                ),
              ]
          ),
        ),
      ),
    );
  }
}
