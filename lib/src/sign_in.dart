import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginsignup/src/utils/custom/custom_circle_button.dart';
import 'package:loginsignup/src/utils/custom/custom_text_field.dart';
import 'package:loginsignup/src/utils/globals.dart';

import 'resetPassword.dart';
import 'sign_up.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isObscureText = false;

  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/1.jpg"),
              fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text('Log In', style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold)),
                          GestureDetector(
                              onTap: (){
                                Navigator.push(context, CupertinoPageRoute(builder: (context) => SignUp()));
                              },
                              child: Text('Sign Up', style: TextStyle(fontSize: 16, color: Colors.white70))),
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
                        suffixIcon1: Icons.visibility,
                        suffixIcon2: Icons.visibility_off,
                      ),
                      GestureDetector(
                        onTap: (){
                          //Navigator.push(context, CupertinoPageRoute(builder: (context) => ResetPassword()));
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
                            Text('Reset', style: TextStyle(color: Colors.white70, fontSize: 14)),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      CustomCicleButton(label: 'Login', textColor: Colors.white, backgroundColor: Colors.deepOrangeAccent,
                          width: mediaQuery(context, 1), height: 50, borderRadius: 8, fontSizeText: 16),
                      SizedBox(height: 10),
                      CustomCicleButton(label: 'Login with Facebook', textColor: Colors.white, backgroundColor: Colors.white24,
                          width: mediaQuery(context, 1), height: 50, borderRadius: 8, fontSizeText: 16),
                      //SizedBox(height: 10),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  _textFormField({width, height = 50.0, controllerTextField, keyboardType, textInputAction, maxLength, focusNode, onChanged,
    textCapitalization, nextFocusNode, labelText, suffixIcon, String Function() errorText}) {
    return Container(
        width: width,
        height: height,
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8)
        ),
        child: TextFormField(
          controller: controllerTextField,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          maxLength: maxLength,
          focusNode: focusNode,
          onChanged: onChanged,
          //textCapitalization: textCapitalization,
          obscureText: _isObscureText,
          inputFormatters: [BlacklistingTextInputFormatter(RegExp(r'[.,]'))],
          //onFieldSubmitted: (v) {},
          onEditingComplete: () {
            FocusScope.of(context).requestFocus(nextFocusNode);
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white30), borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white30), borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white30), borderRadius: BorderRadius.circular(8)),
            labelText: labelText,
            suffixIcon: suffixIcon == null ? null : IconButton(
                icon: Icon(
                  _isObscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white70,
                ),
                onPressed: (){
                  setState(() {
                    _isObscureText = !_isObscureText;
                  });
                }),
            labelStyle: TextStyle(color: Colors.white),
            errorText: errorText == null ? null : errorText(),
          ),
        ));
  }
}
