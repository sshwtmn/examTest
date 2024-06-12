import 'package:flutter/material.dart';
import 'package:kati_masterclass_app/screens/login_screen.dart';
import 'package:kati_masterclass_app/services/auth_service.dart';

import '../components/styled_button.dart';
import '../components/styled_text.dart';



class RegisterScreen extends StatefulWidget {
   const RegisterScreen({super.key, this.onPressed});
   final void Function()? onPressed;
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? errorText;

  void register() async {
    final _authService = AuthService();
    try {
      await _authService.signUpWithEmailAndPassword(
        _emailController.text,
        _passwordController.text,
      );
    }
    catch (e) {
      showDialog(context: context,
          builder: (context) => AlertDialog(title: Text(e.toString()),));
    }
  }


    @override
    Widget build(BuildContext context) {
      final errorText = this.errorText;
      return Scaffold(
        body: SizedBox(
          height: double.infinity,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: const ClampingScrollPhysics(),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    height: 850,
                    child: Image.network(
                      'https://wallpapercave.com/wp/wp8337153.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 320,
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child: Column(children: [
                      if (errorText != null) ...[
                        StyledText(errorText),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                      const Text(
                        'Lets create an account for you',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        controller: _passwordController,
                        // decoration: textFieldDecorator,
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 chars long';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      StyledButton(
                        onPressed: register,
                          // onPressed: () async {
                          //   if (_formKey.currentState!.validate()) {
                          //     final email = _emailController.text.trim();
                          //     final password = _passwordController.text.trim();
                          //     final user =
                          //     await AuthService.signUp(email, password);
                          //   }
                          // },
                          child: const Center(child: StyledText('Register'))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already a member?',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                              onPressed: widget.onPressed,
                              child: const Text(
                                'Login Now',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      )
                    ]),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
