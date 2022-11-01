import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginsignup/src/components/custom_circle_button.dart';
import 'package:loginsignup/src/components/custom_text_field.dart';
import 'package:loginsignup/src/utils/globals.dart';

import 'resetPassword.dart';
import 'sign_up.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isObscureText = false;

  final _email = TextEditingController();
  final _password = TextEditingController();

  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/photo.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());

                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => SignUp(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  CustomTextField(
                    labelText: 'Email',
                    controller: _email,
                    textInputAction: TextInputAction.next,
                    focusNode: _emailFocus,
                    focusScope: _passwordFocus,
                  ),
                  CustomTextField(
                    labelText: 'Password',
                    controller: _password,
                    textInputAction: TextInputAction.done,
                    focusNode: _passwordFocus,
                    iconBool: _isObscureText,
                    suffixIcon1: Icons.visibility,
                    suffixIcon2: Icons.visibility_off,
                    colorText: Colors.white,
                  ),
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ResetPassword();
                        },
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Reset',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  CustomCicleButton(
                    label: 'Login',
                    textColor: Colors.white,
                    backgroundColor: Colors.deepOrangeAccent,
                    width: mediaQuery(context, 1),
                    height: 50,
                    borderRadius: 8,
                    fontSizeText: 16,
                  ),
                  SizedBox(height: 10),
                  CustomCicleButton(
                    height: 50,
                    label: 'Login with Google',
                    textColor: Colors.white,
                    backgroundColor: Colors.white24,
                    width: mediaQuery(context, 1),
                    borderRadius: 8,
                    fontSizeText: 16,
                    imageData: Image.asset(
                      'assets/google.png',
                      scale: 10,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
