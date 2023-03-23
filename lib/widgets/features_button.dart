import 'package:flutter/material.dart';

class BoxButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  final String image;
  const BoxButton({Key? key, required this.title, required this.image, required this.onTap, this.loading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25.0),
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(25.0)
          ),
          padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
          margin: EdgeInsets.all(10.0),
          child: loading ? CircularProgressIndicator() : Column(
            children: [
              Image.asset(image, height: 120,width: 150),
              SizedBox(height: 15.0),
              Text(title, style: TextStyle(color: Colors.white),)
            ],
          ),
      ),
    );
  }
}
