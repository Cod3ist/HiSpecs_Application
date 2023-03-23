import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hispecs_pde2101/widgets/round_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Login'),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller:emailController,
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    helperText: 'enter your email a****@gmail.com',
                    prefixIcon: Icon(Icons.account_circle_outlined)
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter Email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  obscureText: true,
                  decoration:InputDecoration(
                    hintText: 'Enter Password',
                    prefixIcon: Icon(Icons.lock_outline_rounded)
                  ),
                ),
                SizedBox(height: 45,),
                RoundButton(
                  title: 'title',
                  loading: loading,
                  onTap: (){
                    if (_formkey.currentState!.validate()){
                      login();
                    }
                  },
                ),
                SizedBox(height: 15,),
              ],
            ),


        )
      ),
    );
  }

  void login() {
    setState(() {
      loading = true;
    });
    _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
    );
  }
}
