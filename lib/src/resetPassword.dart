import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginsignup/src/utils/globals.dart';

import 'utils/custom/custom_text_field.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  FocusNode _emailFocus = FocusNode();

  final _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  height: mediaQuery(context, 0.7),
                  width: mediaQuery(context, 1),
                  //color: Colors.white10,
                  alignment: Alignment.topCenter,
                  //padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.transparent), onPressed: (){}),
                              Text(
                                "Reset Password?",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              IconButton(icon: Icon(Icons.close, color: Colors.white30), onPressed: (){
                                Navigator.of(context).pop();
                              }),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: mediaQuery(context, 0.06)),
                            child: Text(
                              "Enter email address that you used to sign up your account",
                              style: TextStyle(fontSize: 18, color: Colors.white30),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          /*Padding(
                            padding: EdgeInsets.symmetric(horizontal: mediaQuery(context, 0.1)),
                            child: Text(
                              "Choose option to restore password",
                              style: TextStyle(fontSize: 18, color: Colors.white30),
                              textAlign: TextAlign.center,
                            ),
                          ),*/
                          Divider(color: Colors.white70),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(),
                          Icon(Icons.email, color: Colors.white30),
                          _textFormField(
                            labelText: 'Email',
                            width: mediaQuery(context, 0.75),
                            controllerTextField: _email,
                            textInputAction: TextInputAction.done,
                            focusNode: _emailFocus,
                          ),
                        ],
                      ),
                      SizedBox(height: 30)
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  _textFormField({width, height = 50.0, controllerTextField, keyboardType, textInputAction, maxLength, focusNode, onChanged,
    textCapitalization, nextFocusNode, labelText, suffixIcon, String Function() errorText}) {
    return Container(
        width: width,
        height: height,
        child: TextFormField(
          controller: controllerTextField,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          maxLength: maxLength,
          focusNode: focusNode,
          onChanged: onChanged,
          cursorColor: Colors.white,
          onEditingComplete: () {
            FocusScope.of(context).requestFocus(nextFocusNode);
          },
          decoration: InputDecoration(
            border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white30)),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white30)),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white30)),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            errorText: errorText == null ? null : errorText(),
          ),
        ));
  }
}
