import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final bool loading;
  const AccountButton({Key? key, this.loading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: (){},
        icon: loading ? CircularProgressIndicator() : Icon(Icons.account_circle_outlined, size: 50.0,)
    );
  }
}
