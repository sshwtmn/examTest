import 'package:flutter/material.dart';
import 'package:kati_masterclass_app/screens/login_screen.dart';
import 'package:kati_masterclass_app/screens/register_screen.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginWidget(onPressed: togglePages);
    }else {
      return RegisterScreen(onPressed: togglePages);
    }
  }
}
