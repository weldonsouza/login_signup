import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/custom_circle_button.dart';
import '../components/custom_text_field.dart';
import '../utils/globals.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isObscureText = false;

  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  FocusNode _firstNameFocus = FocusNode();
  FocusNode _lastNameFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/photo.jpg'),
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
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Log In',
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
                    labelText: 'First Name',
                    controller: _firstName,
                    textInputAction: TextInputAction.next,
                    focusNode: _firstNameFocus,
                    focusScope: _lastNameFocus,
                  ),
                  CustomTextField(
                    labelText: 'Last Name',
                    controller: _lastName,
                    textInputAction: TextInputAction.next,
                    focusNode: _lastNameFocus,
                    focusScope: _emailFocus,
                  ),
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
                  SizedBox(height: 15),
                  CustomCicleButton(
                    label: 'Sign Up',
                    textColor: Colors.white,
                    backgroundColor: Colors.deepOrangeAccent,
                    width: mediaQuery(context, 1),
                    height: 50,
                    borderRadius: 8,
                    fontSizeText: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
