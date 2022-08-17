import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:zero/features/auth/screens/signUpScreen.dart';
import 'package:zero/features/auth/services/auth_service.dart';
import 'package:zero/features/auth/widgets/inputField.dart';

class authScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';

  @override
  _authScreenState createState() => _authScreenState();
}

TextEditingController _emailController = TextEditingController();
TextEditingController _passController = TextEditingController();
final formKey = GlobalKey<FormState>();
AuthService authService = AuthService();

class _authScreenState extends State<authScreen> {
  @override
  // TextEditingController _emailController= TextEditingController();
  // TextEditingController _passController=TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.w700,
                          color: Colors.blue),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Please Enter Your Email and Password',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  inputField(_emailController, 'Email', false, context),
                  inputField(_passController, 'Password', true, context),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        print('tap before');
                        authService.signInUser(
                            context: context,
                            email: _emailController.text,
                            password: _passController.text);
                        print('tap after');
                      }
                    },
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      width: 180,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('''Don't you have an account?'''),
                        SizedBox(
                          width: 3,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                          child: Text(
                            'Create new Account',
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
