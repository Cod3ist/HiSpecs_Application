import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hispecs_pde2101/widgets/location.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';
class LiveLocation extends StatefulWidget {
  final String account;
  const LiveLocation({super.key, required this.account});
  @override
  State<LiveLocation> createState() => _LiveLocationState();
}

class _LiveLocationState extends State<LiveLocation> {
  final loc.Location location = loc.Location();
  final database = FirebaseDatabase.instance.ref('Account');
  double lati = 0.0; double longi = 0.0;
  StreamSubscription<loc.LocationData>? _locationSubscription;
  @override
  void initState() {
    super.initState();
    _requestPermission();
    location.changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
    location.enableBackgroundMode(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("live location tracker"),
      ),
      body: Column(
        children: [
          TextButton(onPressed: () {_getLocation();}, child: Text("add my location")),
          TextButton(onPressed: () {_listenLocation();}, child: Text("enable live location")),
          TextButton(onPressed: () {_stopListenting();}, child: Text("stop live location")),
          Expanded(
            child: StreamBuilder(
              stream:
                FirebaseFirestore.instance.collection("location").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title:
                        Text(snapshot.data!.docs[index]["name"].toString()),
                      subtitle: Row(
                        children: [
                          Text(snapshot.data!.docs[index]["latitude"].toString()),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(snapshot.data!.docs[index]["longitude"].toString()),
                        ],
                      ),
                      trailing: IconButton(icon: Icon(Icons.directions), onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MapSample()));
                          //navigates to google maps page
                      })
                    );
                  }
                );
              }
            ),
          ),
        ],
      ),
    );
  }

  _getLocation() async {
    try {
      final loc.LocationData _locationResult = await location.getLocation();
      await FirebaseFirestore.instance
      .collection("location")
      .doc("user1")
      .set({
        "latitude": _locationResult.latitude,
        "longitude": _locationResult.longitude,
        "name": "Your Address"
        }, SetOptions(merge: true));
      database.child(widget.account).child('Location').update({
        'latitude':_locationResult.latitude.toString(),
        'longitude':_locationResult.longitude.toString()
      });
    } catch (e) {
      print(e);
    }

  }

  Future<void> _listenLocation() async {
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((loc.LocationData currentlocation) async {
      await FirebaseFirestore.instance.collection("location").doc("user1").set({
        "latitude": currentlocation.latitude,
        "longitude": currentlocation.longitude,
        "name": "john"
      }, SetOptions(merge: true));
      database.child(widget.account).child('Location').update({
        'latitude':currentlocation.latitude.toString(),
        'longitude':currentlocation.longitude.toString()
      });
    });
  }

  _stopListenting() {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
  }

  _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print("done");
    } else if (status.isDenied) {
      _requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
} 




