import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],

      appBar: AppBar( /// AppBar for the application
        leading: buildAccount(),

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
                      buildLocation(), ///Placing the Location Widget
                      SizedBox(width: 40.0),
                      buildActivities() ///Placing the Activities Widget
                    ]
                ),
              ]
          ),
        ),
      ),

    );
  }
  Widget buildAccount(){
    return IconButton( /// Button to access the account details
        onPressed: () {  },
        icon:Icon(Icons.account_circle_outlined, size: 50.0)
    );
  }

  Widget buildLocation() {
    return Container(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Colors.black26,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(150.0),
            child:Container(
                padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                margin: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Image.asset('images/location.jpg', height: 100,width: 100),
                    SizedBox(height: 10.0),
                    Text('LOCATION')
                  ],
                )
            ),
          ),
        )
    );
  } ///Widget to access the Location Screen

  Widget buildActivities() {
    return Container(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Colors.black26,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(150.0),
            child:Container(
                padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                margin: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Image.asset('images/activities.jpg', height: 100,width: 100),
                    SizedBox(height: 10.0),
                    Text('ACTIVITIES')
                  ],
                )
            ),
          ),
        )
    );
  }///Widget to access the Activities of the user

}
