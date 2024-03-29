import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hispecs_pde2101/ui/splash_screen.dart';
import 'package:hispecs_pde2101/widgets/account_button.dart';
import 'package:hispecs_pde2101/widgets/features_button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
