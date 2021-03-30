import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginsignup/src/components/custom_text_field.dart';
import 'package:loginsignup/src/utils/globals.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _email = TextEditingController();

  FocusNode _emailFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4,
                sigmaY: 4,
              ),
              child: Container(
                width: mediaQuery(context, 1),
                height: mediaQuery(context, 0.6),
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.transparent,
                              ),
                              onPressed: () {},
                            ),
                            Text(
                              "Reset Password?",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.close,
                                color: Colors.white30,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: mediaQuery(context, 0.06),
                          ),
                          child: Text(
                            "Enter email address that you used to sign up your account",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white30,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Divider(
                          color: Colors.white70,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(),
                        Icon(
                          Icons.email,
                          color: Colors.white30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 20,
                          ),
                          child: CustomTextField(
                            width: mediaQuery(context, 0.7),
                            labelText: 'Email',
                            controller: _email,
                            textInputAction: TextInputAction.done,
                            focusNode: _emailFocus,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
