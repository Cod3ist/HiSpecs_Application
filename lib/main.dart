import 'package:flutter/material.dart';
import 'package:hispecs_pde2101/ui/splash_screen.dart';
import 'package:hispecs_pde2101/widgets/account_button.dart';
import 'package:hispecs_pde2101/widgets/features_button.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
