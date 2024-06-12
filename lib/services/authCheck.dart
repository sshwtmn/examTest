import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kati_masterclass_app/screens/main_screen_widget.dart';

import 'lofin_or_register.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            print('Error: ${snapshot.error}');
          }
          if(snapshot.hasData) {
            return  const MainScreenWidget();
          }else {
            return const LoginOrRegister();
          }
        }
      ),
    );
  }
}
