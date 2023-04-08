import 'package:flutter/material.dart';
import 'package:hispecs_pde2101/bluetooth/bluetooth.dart';
import 'package:hispecs_pde2101/widgets/account_button.dart';
import 'package:hispecs_pde2101/widgets/features_button.dart';
import 'package:hispecs_pde2101/widgets/location.dart';

class MainPageScreen extends StatefulWidget {

  final String account;
  final String DeviceConnected;
  const MainPageScreen({Key? key, required this.account, required this.DeviceConnected}) : super(key: key);

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],

      appBar: AppBar( /// AppBar for the application
        leading: AccountButton(account: widget.account,),
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
                      BoxButton(title: 'LOCATION', image: 'images/location.jpg', onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => MapSample()));
                      },), ///Placing the Location Widget
                      SizedBox(width: 10.0),
                      BoxButton(title: 'ACTIVITIES', image: 'images/activities.jpg', onTap: (){})///Placing the Activities Widget
                    ]
                ),
                SizedBox(height: 20.0),
                Row(
                    children: <Widget>[
                      SizedBox(width: 20.0),
                      BoxButton(title: 'BLUETOOTH', image: 'images/bluetooth.png', onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterBlueApp(account: widget.account)));},), ///Placing the Bluetooth Widget
                      SizedBox(width: 10.0),
                      BoxButton(title: 'DISPLAY SETTINGS', image: 'images/display_settings.jpg', onTap: (){  })///Placing the Display Settings Widget
                    ]
                ),
              ]
          ),
        ),
      ),

    );
  }
}
