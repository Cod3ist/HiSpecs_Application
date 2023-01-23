import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: (){},
        icon: Icon(Icons.account_circle_outlined)
    );
  }
}
