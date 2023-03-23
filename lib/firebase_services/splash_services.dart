import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../MainPage.dart';
import '../ui/login_Screen.dart';

class SplashServices{

  void isLogin(BuildContext context){

    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null){
      Timer(Duration(seconds: 4), () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())));
    } else {
      Timer(Duration(seconds: 4), () => Navigator.push(context, MaterialPageRoute(builder: (context) => MainPageScreen())));
    }

  }

}