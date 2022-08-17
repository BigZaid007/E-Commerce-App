import 'package:flutter/material.dart';
import 'package:zero/features/auth/screens/loginScreen.dart';
import 'package:zero/features/auth/services/auth_service.dart';

import '../widgets/inputField.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
final formkey = GlobalKey<FormState>();
AuthService authService = AuthService();

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: formkey,
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
                  inputField(name, 'Name', false, context),
                  inputField(email, 'Email', false, context),
                  inputField(password, 'Password', true, context),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        authService.signUpUser(
                            name: name.text,
                            email: email.text,
                            password: password.text, context: context);

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
                        'Register',
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
                        Text('''Already you have an account?'''),
                        SizedBox(
                          width: 3,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>authScreen()));
                          },
                          child: Text(
                            'Login',
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
