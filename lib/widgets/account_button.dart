import 'package:flutter/material.dart';
import 'package:hispecs_pde2101/account.dart';

class AccountButton extends StatelessWidget {
  final String account;
  final bool loading;
  const AccountButton({Key? key, required this.account, this.loading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AccountScreen(account: account)));
        },
        icon: loading ? CircularProgressIndicator() : Icon(Icons.account_circle_outlined, size: 50.0,)
    );
  }
}
