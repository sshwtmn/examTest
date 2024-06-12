import 'package:flutter/material.dart';
import 'package:kati_masterclass_app/screens/register_screen.dart';
import 'package:kati_masterclass_app/services/auth_service.dart';

import '../components/styled_button.dart';
import '../components/styled_text.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void login() async {
    final _authservice = AuthService();

    try {
      await _authservice.signInWithEmailAndPassword(
          _emailController.text, _passwordController.text);
    }
    catch (e) {
      showDialog(context: context,
          builder: (context)=> AlertDialog(
            title: Text(e.toString()),
          ));
    }
  }


  @override
  Widget build(BuildContext context) {
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
                  height: 350,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  child: Column(children: [
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
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    StyledButton(
                      onPressed: login,
                        // onPressed: () async {
                        //   if (_formKey.currentState!.validate()) {
                        //     final email = _emailController.text.trim();
                        //     final password = _passwordController.text.trim();
                        //
                        //     final user = await AuthService.login(
                        //         email, password);
                        //   }
                        // },
                        child: const Center(child: StyledText('Login'))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Not a member?',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                            onPressed: widget.onPressed,
                            child: const Text(
                              'Register now',
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
